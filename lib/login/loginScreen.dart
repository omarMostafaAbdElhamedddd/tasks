import 'package:flutter/material.dart';
import 'package:tasks/home/homeScreen.dart';
import 'package:tasks/signup/signupScreen.dart';

import '../forgetPassword/forgetpasswordscreen.dart';
import '../helper/customWidgets/customButton.dart';
import '../helper/customWidgets/customTextFormField.dart';
import '../helper/customWidgets/logoWidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32,),

                Center(child: LogoWidget()),
                SizedBox(height: 24,),

                Center(
                  child: const Text(
                    "Welcome! Login to continue",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),

                Text("Email address",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  prifixIcon: Icons.email_outlined,
                  hintText:"Enter Email",

                ),



                const SizedBox(height: 20),
                Text("Password",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  prifixIcon: Icons.lock_outline_sharp,
                  hintText:"Enter Password",
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,PageRouteBuilder(pageBuilder:(context,an,sc){
                            return ForgotPasswordScreen();
                        })
                        );

                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                CustomButton(
                  text: "Login",
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder:(context,sn,sc){
                      return HomeScreen();
                    }));
                  },
                ),

                const SizedBox(height: 16),

                 Center(
                  child: TextButton(onPressed:(){
                    Navigator.push(context,PageRouteBuilder(pageBuilder:(context,sn,sc){
                      return CreateAccountScreen();
                    }));

                  }, child: Text("Don't have an account? Create Account", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}