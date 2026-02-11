import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "Task name",
                validator: (data){
                              if(data!.isEmpty){
                                return "Please enter your name";
                              }
                              return null;
                },
              ),
          
              const SizedBox(height: 16),
          
              CustomTextFormField(
                hintText: "Description",
                validator: (data){
                              if(data!.isEmpty){
                                return "Please enter your description";
                              }
                              return null;
                },
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
                    validator: (data){
                              if(data!.isEmpty){
                                return "Please enter your due date";
                              }
                              return null;
                },
                  ),
                ),
              ),
          
              const Spacer(),
          
              CustomButton(
                onTap: (){
                  if(formKey.currentState!.validate()){

                  }
                },
                text: "Add Task",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

