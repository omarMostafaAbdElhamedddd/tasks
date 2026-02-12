




import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/custom_snack_bar.dart';


class AddNewTaskModel extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  final RxBool isLoading = false.obs;
  final RxBool succes = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    desController.dispose();

    super.onClose();
  }


  Future<void> addnewTask(BuildContext context, String dueDate,int minutes) async {
    isLoading.value = true;
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final taskData = {
          'uid': user.uid,
          'name': nameController.text,
          'des': desController.text,
          'created At': DateTime.now().toIso8601String(),
          "dueDateTime" :dueDate ,
          "rememberMinutes": minutes,
        };

        await FirebaseFirestore.instance
            .collection('tasks').doc()
            .set(taskData);

        succes.value =true;
        MessageUtils.showSnackBar(
        context: context,
        message: "Task created successfully",
        baseStatus: BaseStatus.success,
      );
        resetForm();

      }
    } catch (e) {
      MessageUtils.showSnackBar(
        message: "Failed To add task",
        baseStatus: BaseStatus.error, context: context,
      );
      rethrow;
    }
    isLoading.value=false;

  }

  void resetForm(){
    nameController.clear();
    desController.clear();
  }
}
