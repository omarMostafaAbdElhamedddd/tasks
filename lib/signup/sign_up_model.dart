
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/custom_snack_bar.dart';


class SignUpModel extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool isLevelFocused = false.obs;

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  final RxString selectedLevel = ''.obs;

  final RxString selectedCountry = ''.obs;
  final RxInt selectedIndex = (-1).obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }



  Future<void> signUp(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    isLoading.value = true;

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      await _addUserToCollection(context);
      MessageUtils.showSnackBar(
        context: context,
        message: "Account created successfully",
        baseStatus: BaseStatus.success,
      );
      resetForm();
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MessageUtils.showSnackBar(
          context: context,
          message: "weak Password",
          baseStatus: BaseStatus.error,
        );
      } else if (e.code == 'email-already-in-use') {
        MessageUtils.showSnackBar(
          context: context,
          message: "email Already Exist",
          baseStatus: BaseStatus.error,
        );
      }
    } catch (e) {
      MessageUtils.showSnackBar(
        message: e.toString(),
        baseStatus: BaseStatus.error,
        context: context,
      );
    }
    isLoading.value = false;
  }

  void resetForm() {
    emailController.clear();
    passwordController.clear();
    confirmpasswordController.clear();
    nameController.clear();
  }

  Future<void> _addUserToCollection(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = {
          'uid': user.uid,
          'name': nameController.text,
          'email': emailController.text,
          'created At': DateTime.now().toIso8601String(),
        };

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .set(userData);
      }
    } catch (e) {
      MessageUtils.showSnackBar(
        message: "Failed To Save User Data",
        baseStatus: BaseStatus.error, context: context,
      );
      rethrow;
    }
  }
}
