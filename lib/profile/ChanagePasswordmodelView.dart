import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/custom_snack_bar.dart';




class ChanagePasswordModelView extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final RxBool isChangingPassword = false.obs;

  String? validatePassword(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return "This field is required";
    }
    if (text.length < 6) {
      return "Please enter strong password";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return"This field is required";
    }
    if (text != newPasswordController.text.trim()) {
      return "Password not match";
    }
    return null;
  }

  Future<void> changePassword(BuildContext context) async {
    if (isChangingPassword.value) return;

    if (!(changePasswordFormKey.currentState?.validate() ?? false)) return;

    final user = _auth.currentUser;

    final currentPassword = currentPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();

    try {
      isChangingPassword.value = true;

      final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      MessageUtils.showSnackBar(
        context: context,
        baseStatus: BaseStatus.success,
        message:"Password Updated successfully",
      );

      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        MessageUtils.showSnackBar(
          context: context,
          baseStatus: BaseStatus.error,
          message: "Currect password incorrect",
        );
      } else {
        MessageUtils.showSnackBar(
          context: context,
          baseStatus: BaseStatus.error,
          message: "Something went wrong",
        );
      }
    } catch (e) {
      MessageUtils.showSnackBar(
        context: context,
        baseStatus: BaseStatus.error,
        message: "Failed to update password",
      );
    } finally {
      isChangingPassword.value = false;
    }
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}