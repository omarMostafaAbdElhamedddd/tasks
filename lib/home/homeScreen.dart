import 'package:flutter/material.dart';
import 'package:tasks/addTask/addTaskScreen.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/notofications/notoficationScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: SizedBox(
        height: 84,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: CustomButton(
            text: "Add new task",
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, sn, sc) {
                    return AddTaskScreen();
                  },
                ),
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Main screen",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  InkWell(
                      onTap:(){
                        Navigator.push(context,PageRouteBuilder(pageBuilder: (context,an,sc){
                          return NotoficationScreen();
                        }));
                      },
                      child: Image.asset("assets/notification.png", height: 24)),
                ],
              ),
              SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskItemWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withAlpha(10),
         border: BoxBorder.all(color: Colors.black.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Football Training",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.withAlpha(30)
                  ),
                  child: Icon(Icons.delete_forever, size: 22,color: Colors.red,)),
              SizedBox(width: 16,),
              InkWell(
                onTap: (){
                  Navigator.push(context, PageRouteBuilder(pageBuilder:(context,an,sc){
                    return AddTaskScreen();
                  }));
                },
                child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withAlpha(30)
                    ),
                    child: Icon(Icons.mode_edit_outlined, size: 22,color: Colors.blue,)),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "I have football training and i need to get my soccer ball",
            style: TextStyle(color: Colors.black.withAlpha(150), fontSize: 14),
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              Text(
                "11-2-2026 at 7pm",
                style: TextStyle(color: Colors.black.withAlpha(150),
                fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),
              Spacer(),
              Text(
                "11-11-2026 at 7pm",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
