import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          "Add task",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Task name", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 4,),
            CustomTextFormField(
              hintText: "Task name",
            ),

            const SizedBox(height: 16),
            Text("Task description", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 4,),
            CustomTextFormField(
              maxLines: 3,

              hintText: "Description",
            ),

            const SizedBox(height: 16),

            Text("End date", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 4,),
            GestureDetector(
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                    onDatePickerModeChange: (date){
                    log("000000000000");
                    log(date.toString());
                    dateController.text=date.toString();
                    log(dateController.text);

                  }
                );
              },
              child: AbsorbPointer(
                child: CustomTextFormField(
                  controller: dateController,
                  hintText: "Enter end date",
                ),
              ),
            ),

            const Spacer(),


            CustomButton(
              text: "Add Task",
            ),
          ],
        ),
      ),
    );
  }
}

