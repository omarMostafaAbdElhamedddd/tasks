import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tasks/home/homeScreen.dart';

import '../helper/custom_snack_bar.dart';


class LoginViewModel extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login(BuildContext context) async {

    isLoading.value = true;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text,
          );

      Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
        return HomeScreen();
      }));
    } on FirebaseAuthException {
      MessageUtils.showSnackBar(
        context: context,
        message: "Email not found or incorrect password",
        baseStatus: BaseStatus.error,
      );
    } catch (e) {
      MessageUtils.showSnackBar(
        context: context,
        message: "An error occurred while logging in.",
        baseStatus: BaseStatus.error,
      );
    }
    isLoading.value = false;
  }







}
