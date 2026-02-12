import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/custom_snack_bar.dart';

class AddNewTaskModel extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool succes = false.obs;

  final Rx<DateTime?> dueDateTime = Rx<DateTime?>(null);
  final RxInt reminderMinutes = 0.obs;

  final List<int> reminderOptions = [0, 5, 10, 15, 20, 25, 30, 40, 50, 60];

  String get dueDateText {
    if (dueDateTime.value == null) return "Due date & time";
    final d = dueDateTime.value!;
    return "${d.day}/${d.month}/${d.year}   ${d.hour}:${d.minute.toString().padLeft(2, '0')}";
  }

  Future<void> pickDueDateTime(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    dueDateTime.value = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );
  }

  Future<void> addnewTask(BuildContext context) async {
    if (dueDateTime.value == null) {
      MessageUtils.showSnackBar(
        message: "Due date is required",
        baseStatus: BaseStatus.error,
        context: context,
      );
      return;
    }

    isLoading.value = true;

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final taskData = {
          'uid': user.uid,
          'name': nameController.text,
          'des': desController.text,
          'created At': DateTime.now().toIso8601String(),
          "dueDateTime": dueDateText,
          "rememberMinutes": reminderMinutes.value,
        };

        await FirebaseFirestore.instance.collection('tasks').doc().set(taskData);

        succes.value = true;
      MessageUtils.showSnackBar(
        context: context,
        message: "task add succesfly",
        baseStatus: BaseStatus.success,
      );
        resetForm();
      }
    } catch (e) {
      MessageUtils.showSnackBar(
        message: "Failed To add task",
        baseStatus: BaseStatus.error,
        context: context,
      );
    }

    isLoading.value = false;
  }

  void resetForm() {
    nameController.clear();
    desController.clear();
    dueDateTime.value = null;
    reminderMinutes.value = 0;
  }

  @override
  void onClose() {
    nameController.dispose();
    desController.dispose();
    super.onClose();
  }
}
