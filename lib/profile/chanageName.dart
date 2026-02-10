import 'package:flutter/material.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';

class ChanageNameScreen extends StatelessWidget {
  const ChanageNameScreen({super.key});

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
            CustomTextFormField(hintText: "Enter your new username"),
            Spacer(),
            CustomButton(text: "Save")
          ],
        ),
      ),
    );
  }
}
