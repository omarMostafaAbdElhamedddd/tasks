import 'package:flutter/material.dart';
import 'package:tasks/helper/color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText,
    this.maxLines=1,
    this.prifixIcon, this.controller});

  final String hintText;
  final IconData? prifixIcon;
  final TextEditingController? controller;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16, vertical: 16
        ),
        fillColor: Colors.grey.withAlpha(30),
        filled: true,
        
        prefixIcon:prifixIcon == null? null:Icon(prifixIcon),

        hintStyle: TextStyle(
          fontSize: 14
        ),
        
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor.withAlpha(150),
          ),
          borderRadius: BorderRadius.circular(12)
        ),


        hintText: hintText,


        border:  OutlineInputBorder(
      borderSide: BorderSide(
      color: AppColors.greyColor,
      ),
        borderRadius: BorderRadius.circular(12)
    ),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor,
            ),
            borderRadius: BorderRadius.circular(12)
        ),

        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.errorColor,
            ),
            borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}
