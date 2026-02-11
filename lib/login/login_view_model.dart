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
  final RxBool showVerificationDialog = false.obs;
  final RxBool isResendingEmail = false.obs;
  final RxBool isCheckingVerification = false.obs;
  final RxInt verificationCount = 60.obs;
  Timer? _verificationTimer;

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  void startVerificationCountdown() {
    verificationCount.value = 60;

    _verificationTimer?.cancel();

    _verificationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (verificationCount.value > 0) {
        verificationCount.value--;
      } else {
        timer.cancel();
      }
    });
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

  Future<void> resendVerificationEmail(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    isResendingEmail.value = true;

    try {
      await user.sendEmailVerification();
      MessageUtils.showSnackBar(
        context: context,
        message: "Verification email sent successfully",
        baseStatus: BaseStatus.success,
      );
      await user.reload();
      verificationCount.value = 60;
      startVerificationCountdown();
    } catch (e) {
      MessageUtils.showSnackBar(
        context: context,
        message: "An error occurred while logging in.",
        baseStatus: BaseStatus.error,
      );
    } finally {
      isResendingEmail.value = false;
    }
  }





}
