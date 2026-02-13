import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/login/loginScreen.dart';
import 'package:tasks/profile/chanageName.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/profile/chanagePassword.dart';

import '../helper/color.dart';
import '../helper/custom_snack_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),


            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("Users").where(
                  "uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid
                ).snapshots(),
                builder: (context,sna){
                  if(sna.connectionState==ConnectionState.waiting){
                    return Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CupertinoActivityIndicator(color: AppColors.primaryColor, radius: 16),
                    ));
                  }
                  else if(sna.hasData){
                    return Column(
                      children: [
                         Center(
                          child: Text(
                            sna.data!.docs[0]["name"],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                        sna.data!.docs[0]["email"],
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    );
                  }
                  else if(sna.hasError){
                    return Center(child: Text("Something went wrong"),);
                  }else{
                    return SizedBox();
                  }

                }),


            SizedBox(height: 32),
            GestureDetector(onTap: (){
              Navigator.push(context,PageRouteBuilder(pageBuilder:(context,an,sc){
                            return ChanageNameScreen();
            }) 
              );
            },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withAlpha(160)),
                ),
                child: Row(
                  children: [
                    Text(
                      "Change your name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,PageRouteBuilder(pageBuilder:(context,an,sc){
                    return ChanagePassword();
                  })
                  );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withAlpha(160)),
                ),
                child: Row(
                  children: [
                    Text(
                      "Change your pasword",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withAlpha(160)),
                ),
                child: Row(
                  children: [
                    Text(
                      "Go to your tasks",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: (){
                try {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context,an,sc){
                    return LoginScreen();
                  }));

                } on Exception catch (e) {
                  MessageUtils.showSnackBar(
                    context: context,
                    baseStatus: BaseStatus.error,
                    message: "Something went wrong",
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(30),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.withAlpha(160)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Icon(Icons.logout, color: Colors.red, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}