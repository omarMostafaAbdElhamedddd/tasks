import 'package:flutter/material.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';

import '../helper/customWidgets/customTextFormField.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

     onTap: (){
       FocusScope.of(context).unfocus();
     },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            "Forgot Password",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                CustomTextFormField(
                  prifixIcon: Icons.email_outlined,
                  hintText:"Enter Email",

                ),


                const SizedBox(height: 32),
              CustomButton(text:"Continue"),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
