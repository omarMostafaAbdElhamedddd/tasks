import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tasks/addTask/addTaskScreen.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import 'package:tasks/notofications/notoficationScreen.dart';

import '../helper/customWidgets/fullPageLoading.dart';
import '../profile/profileScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: SizedBox(
        height: 74,
        child: Padding(
          padding: const EdgeInsets.only(top: 4,left: 16, right: 16, bottom: 16),
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
                  SizedBox(width: 16,),
                  InkWell(
                      onTap:(){
                        Navigator.push(context,PageRouteBuilder(pageBuilder: (context,an,sc){
                          return ProfileScreen();
                        }));
                      },
                      child: Icon(Icons.person_pin_outlined)),
                ],
              ),
              SizedBox(height: 16),

              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("tasks").where("uid",isEqualTo:FirebaseAuth.instance.currentUser!.uid )
                      .orderBy("created At", descending: true).snapshots(),
                  builder: (context,sna){
                    if(sna.connectionState==ConnectionState.waiting){
                      return  Expanded(child: Center(child: CupertinoActivityIndicator(color: AppColors.primaryColor, radius: 16)));
                    }else if(sna.hasData){
                      if(sna.data!.docs.length==0){
                        return Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/noData.svg", height: 130,),
                            SizedBox(height: 12,),
                            Text("No tasks added yet!"),
                          ],
                        ));
                      }else{
                        return  Expanded(
                          child: ListView.builder(
                            itemCount: sna.data!.docs.length,
                            itemBuilder: (context, index) {
                              return TaskItemWidget(taskData: sna.data!.docs[index],);
                            },
                          ),
                        );
                      }
                    }else if(sna.hasError){
                      return Expanded(child: Center(child: Text("Something went wrong"),));
                    }else {
                      return SizedBox();
                    }
                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.taskData});

  final dynamic taskData;
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
                taskData["name"],
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
          taskData["des"],
            style: TextStyle(color: Colors.black.withAlpha(150), fontSize: 14),
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              Text(
                DateFormat('EEEE d MMMM yyyy - hh:mm a', 'en')
                    .format(DateTime.parse(taskData["created At"])),
                style: TextStyle(color: Colors.black.withAlpha(150),
                fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),
              Spacer(),
              Text(
                taskData["dueDateTime"],
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
