import 'package:flutter/material.dart';
import 'package:tasks/signup/signupScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل دخول")),

      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, an, sc) {
                    return SignupScreen();
                  },
                ),
              );
            },
            child: Text("إنشاء حساب"),
          ),
        ],
      ),
    );
  }
}
