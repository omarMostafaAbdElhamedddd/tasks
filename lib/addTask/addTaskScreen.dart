import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasks/addTask/addNewTaskModelView.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';

import '../helper/customWidgets/fullPageLoading.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? dueDateTime;
  int reminderMinutes = 0;

  final List<int> reminderOptions = [0, 5, 10, 15, 20, 25, 30, 40, 50, 60];

  Future<void> pickDueDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    setState(() {
      dueDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  String get dueDateText {
    if (dueDateTime == null) return "Due date & time";
    return "${dueDateTime!.day}/${dueDateTime!.month}/${dueDateTime!.year}   ${dueDateTime!.hour}:${dueDateTime!.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final vm = Get.put(AddNewTaskModel());

    return Obx(()=>Stack(
      children: [
      Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: CustomButton(
            text: "Add Task",
            onTap: () {
              if (_formKey.currentState!.validate()){
                vm.addnewTask(context, dueDateText, reminderMinutes);

              };
            },
          ),
        ),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const Text(
          "Add task",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Text("Task name",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  controller: vm.nameController,
                  hintText: "Task name",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Task name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text("Task description",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                CustomTextFormField(
                  controller: vm.desController,
                  hintText: "Description",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Task Description is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text("Due date and time",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                GestureDetector(
                  onTap: pickDueDateTime,
                  child: AbsorbPointer(
                    child: CustomTextFormField(
                      validator: (value) {
                        if (dueDateText == "Due date & time") {
                          return "${dueDateText} is required";
                        }
                        return null;
                      },
                      hintText: dueDateText,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text("Minutes before for remember",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 4,),
                DropdownButtonFormField<int>(
                  value: reminderMinutes,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withAlpha(30),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withAlpha(200),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.greyColor,
                        width: .5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: reminderOptions.map((minutes) {
                    String text;
                    if (minutes == 0) {
                      text = "No reminder";
                    } else if (minutes == 60) {
                      text = "1 hour before";
                    } else {
                      text = "$minutes minutes before";
                    }
                    return DropdownMenuItem(
                      value: minutes,
                      child: Text(text),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      reminderMinutes = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
        Visibility(
            visible: vm.isLoading.value,
            child: FullPageLoadingWidget()),
      ],
    ));
  }
}
