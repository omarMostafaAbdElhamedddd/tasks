import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';

import '../helper/custom_snack_bar.dart';

class ChanageNameScreen extends StatefulWidget {
  const ChanageNameScreen({super.key});

  @override
  State<ChanageNameScreen> createState() => _ChanageNameScreenState();
}

class _ChanageNameScreenState extends State<ChanageNameScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Change your name",style: TextStyle(
          fontSize: 15
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
            SizedBox(height: 4),
            CustomTextFormField(
              controller: nameController,

                hintText: "Enter your new username"),
            Spacer(),
            CustomButton(text: "Save", onTap: (){

              if(nameController.text.length<2){
                MessageUtils.showSnackBar(
                  context: context,
                  message: "Please enter your name",
                  baseStatus: BaseStatus.error,
                );
              }else{
                try {
                  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).update(
                    {
                      "name" : nameController.text
                    }
                  );
                  MessageUtils.showSnackBar(
                    context: context,
                    message: "Name updated successfully",
                    baseStatus: BaseStatus.success,
                  );
                  Navigator.pop(context);
                } on Exception catch (e) {
                   MessageUtils.showSnackBar(
              context: context,
              message: "An error occurred while update name",
              baseStatus: BaseStatus.error,
              );
                }


              }

            },)
          ],
        ),
      ),
    );
  }
}
