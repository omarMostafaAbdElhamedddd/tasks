
import 'package:flutter/material.dart';
import 'package:tasks/addTask/addTaskScreen.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: SizedBox(
          height:84,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: CustomButton(text: "Add new task", onTap: (){
              Navigator.push(context, PageRouteBuilder(pageBuilder:(context,sn,sc){
                return AddTaskScreen();
              }));
            },),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Main screen", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),),
                  Spacer(),
                  Image.asset("assets/notification.png", height: 24,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
