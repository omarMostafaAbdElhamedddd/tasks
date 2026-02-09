import 'package:flutter/material.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
class ChanagePassword extends StatelessWidget {
  const ChanagePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
  appBar: AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Text('Chanage Password' ,style: TextStyle(
      fontSize : 16
    ),),
  

  ),
  body: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('current password'),
        SizedBox(height: 4,),
        CustomTextFormField(
          prifixIcon: Icons.lock,
          hintText: 'current password'),
          SizedBox(height: 16,),

                  Text('new password'),
        SizedBox(height: 4,),
        CustomTextFormField(
          prifixIcon: Icons.lock,
          hintText: 'new password'),
          SizedBox(height: 16,),

                  Text('confirm password'),
        SizedBox(height: 4,),
        CustomTextFormField(
          prifixIcon: Icons.lock,
          hintText: 'confirm password'),

          Spacer(),

          CustomButton(
            text: 'change password' ),
      ],
      
    ),
  ),
    );
  }
}
