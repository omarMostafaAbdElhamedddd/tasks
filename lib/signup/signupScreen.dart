import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
import 'package:tasks/helper/customWidgets/logoWidget.dart';
import 'package:tasks/signup/sign_up_model.dart';


class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Get.put(SignUpModel());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0,
        title: Text("Create Account"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: vm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Center(child: LogoWidget()),
                SizedBox(height: 24,),
                Center(
                  child: Text(
                    "Welcome, create a new account",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 20),


                Text("Name",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  validator: (data){
                    if(data!.isEmpty){
                      return "Please enter name";
                    }
                  },
                  controller: vm.nameController,
                  prifixIcon: Icons.person,
                  hintText: "Name",),

                const SizedBox(height: 16),

                Text("Email address",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  validator: (data){
                    if(data!.isEmpty){
                      return "Please enter email";
                    }
                  },
                  controller: vm.emailController,
                  prifixIcon: Icons.email_outlined,
                  hintText:"Enter Email",

                ),

                const SizedBox(height: 16),
                Text("Password",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  validator: (data){
                    if(data!.isEmpty){
                      return "Please enter password";
                    }
                  },
                  controller: vm.passwordController,
                  prifixIcon: Icons.lock_outline_sharp,
                  hintText:"Enter Password",
                ),

                SizedBox(height: 16),
                Text("Confirm Password",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  validator: (data){
                    if(data!.isEmpty){
                      return "Please confirm password";
                    }else if(data != vm.passwordController.text){
                      return "Password not match";
                    }
                  },
                  controller: vm.confirmpasswordController,
                  prifixIcon: Icons.lock_outline_sharp,
                  hintText:"Confirm Password",
                ),


                SizedBox(height: 20),

                CustomButton(text: "Create Account", onTap: (){
                  if(vm.formKey.currentState!.validate()){
                    vm.signUp(context);

                  }
                },),



                SizedBox(height: 16),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Already have an account? Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}