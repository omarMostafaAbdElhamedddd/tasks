import 'package:flutter/material.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

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
          children: [
            CustomTextFormField(
              hintText: "Task name",
            ),

            const SizedBox(height: 16),

            CustomTextFormField(
              hintText: "Description",
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
              },
              child: AbsorbPointer(
                child: CustomTextFormField(
                  hintText: "Due date",
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

