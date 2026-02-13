import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
import 'package:tasks/profile/ChanagePasswordmodelView.dart';

import '../helper/customWidgets/fullPageLoading.dart';

class ChanagePassword extends StatefulWidget {
  const ChanagePassword({super.key});

  @override
  State<ChanagePassword> createState() => _ChanagePasswordState();
}

class _ChanagePasswordState extends State<ChanagePassword> {
  @override
  Widget build(BuildContext context) {
    final vm = Get.put(ChanagePasswordModelView());
    return Obx(()=>Stack(children: [
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text('Chanage Password', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: vm.changePasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('current password'),
                SizedBox(height: 4),
                CustomTextFormField(
                  controller: vm.currentPasswordController,

                  prifixIcon: Icons.lock_outline,
                  hintText: 'current password',
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Please enter your current password";
                    }
                  },
                ),
                SizedBox(height: 16),

                Text('new password'),
                SizedBox(height: 4),
                CustomTextFormField(
                  controller: vm.newPasswordController,
                  prifixIcon: Icons.lock_outline,
                  hintText: 'new password',
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Please enter your new password";
                    }else if(data!.length<6){
                      return "Please enter strong password";
                    }
                  },
                ),
                SizedBox(height: 16),

                Text('confirm password'),
                SizedBox(height: 4),
                CustomTextFormField(
                  controller: vm.confirmPasswordController,
                  prifixIcon: Icons.lock_outline,
                  hintText: 'confirm password',
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Please confirm your new password";
                    }else if(data!.length<6){
                      return "Please enter strong password";
                    }else if(data!!=vm.newPasswordController.text){
                      return "Password don't match";
                    }
                  },
                ),

                SizedBox(height: 32),

                CustomButton(
                  onTap: () {

                    vm.changePassword(context);

                  },
                  text: 'Change password',
                ),
              ],
            ),
          ),
        ),
      ),
    ),
      Visibility(
          visible: vm.isChangingPassword.value,
          child: FullPageLoadingWidget()),
    ],));
  }
}
