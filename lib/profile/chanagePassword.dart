import 'package:flutter/material.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
class ChanagePassword extends StatefulWidget {
  const ChanagePassword({super.key});

  @override
  State<ChanagePassword> createState() => _ChanagePasswordState();
}

class _ChanagePasswordState extends State<ChanagePassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('current password'),
          SizedBox(height: 4,),
          CustomTextFormField(
            prifixIcon: Icons.lock_outline,
            hintText: 'current password',
               validator: (data){
                              if(data!.isEmpty){
                                return "Please enter your current password";
                              }
                            },
            
            
            ),
            SizedBox(height: 16,),
      
                    Text('new password'),
          SizedBox(height: 4,),
          CustomTextFormField(
            prifixIcon: Icons.lock_outline,
            hintText: 'new password',
             
                validator: (data){
                              if(data!.isEmpty){
                                return "Please enter your new password";
                              }
                            },
            
            ),
            SizedBox(height: 16,),
      
                    Text('confirm password'),
          SizedBox(height: 4,),
          CustomTextFormField(
            prifixIcon: Icons.lock_outline,
            hintText: 'confirm password',
               validator: (data){
                              if(data!.isEmpty){
                                return "Please confirm your new password";
                              }
                            },
            ),
      
            Spacer(),
      
            CustomButton(
              onTap: (){
                if(formKey.currentState!.validate()){

                }
              },
              text: 'change password' ),
        ],
        
      ),
    ),
  ),
    );
  }
}
