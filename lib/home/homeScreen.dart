
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
              SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(itemBuilder: (context,index){
                  return Taskitem();
                }),
              )            
            ],
          ),
        ),
      ),
    );
  }
}

class Taskitem extends StatelessWidget {
  const Taskitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(border: BoxBorder.all(color: Colors.black.withAlpha(150))),
      child: Column(
            children: [
              Text("Football Training", style: TextStyle(
                color: Colors.black,fontSize: 15
                ),
                ),
              Text("I have football training and i need to get my soccer ball", style: TextStyle(
                color: Colors.black.withAlpha(150)
                ),
                ),
                Text("I need to be ready at 11-2-2026 at 7pm",style: TextStyle(
                color: Colors.black.withAlpha(150)
                ),
                )
            ],
          )
        
      );
  }
}
