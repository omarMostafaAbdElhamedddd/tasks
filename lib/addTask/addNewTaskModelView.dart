




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


  Future<void> addnewTask(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = {
          'uid': user.uid,
          'name': nameController.text,
          'des': desController.text,
          'created At': DateTime.now().toIso8601String(),
          "endDate" : ""
        };

        await FirebaseFirestore.instance
            .collection('tasks').doc()
            .set(userData);
      }
    } catch (e) {
      MessageUtils.showSnackBar(
        message: "Failed To add task",
        baseStatus: BaseStatus.error, context: context,
      );
      rethrow;
    }
  }
}
