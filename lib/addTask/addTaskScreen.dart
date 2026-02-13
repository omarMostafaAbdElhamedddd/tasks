import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/addTask/addNewTaskModelView.dart';
import 'package:tasks/helper/color.dart';
import 'package:tasks/helper/customWidgets/customTextFormField.dart';
import 'package:tasks/helper/customWidgets/customButton.dart';
import '../helper/customWidgets/fullPageLoading.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key,this.isEdit=false,this.taskData});

  final bool isEdit;
  final dynamic? taskData;


  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = Get.put(AddNewTaskModel(data: widget.taskData));

    return Obx(() => Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.whiteColor,
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: CustomButton(
                text:widget.isEdit ? "Edit task" :"Add Task",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    vm.addnewTask(context);
                  }
                },
              ),
            ),
          ),
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            title:  Text(
              widget.isEdit ? "Edit task" :"Add Task",
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
                    const SizedBox(height: 16),
                    const Text(
                      "Task name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
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
                    const Text(
                      "Task description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
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
                    const Text(
                      "Due date and time",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Obx(() => GestureDetector(
                      onTap: () => vm.pickDueDateTime(context),
                      child: AbsorbPointer(
                        child: CustomTextFormField(
                          validator: (value) {
                            if (vm.dueDateTime.value == null) {
                              return "Due date & time is required";
                            }
                            return null;
                          },
                          hintText: vm.dueDateText,
                        ),
                      ),
                    )),
                    const SizedBox(height: 16),
                    const Text(
                      "Minutes before for remember",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Obx(() => DropdownButtonFormField<int>(
                      value: vm.reminderMinutes.value,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withAlpha(30),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.withAlpha(200)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.greyColor, width: .5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: vm.reminderOptions.map((minutes) {
                        String text;
                        if (minutes == 0) {
                          text = "No reminder";
                        } else if (minutes == 60) {
                          text = "1 hour before";
                        } else {
                          text = "$minutes minutes before";
                        }
                        return DropdownMenuItem(
                            value: minutes, child: Text(text));
                      }).toList(),
                      onChanged: (value) =>
                      vm.reminderMinutes.value = value!,
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: vm.isLoading.value,
          child: FullPageLoadingWidget(),
        ),
      ],
    ));
  }
}
