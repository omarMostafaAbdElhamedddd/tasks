import 'package:flutter/material.dart';
import 'package:tasks/helper/color.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text("Add task",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}

