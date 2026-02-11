
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/helper/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,this.onTap});
final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
