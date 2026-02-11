import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../color.dart';




  class FullPageLoadingWidget extends StatelessWidget {
  const FullPageLoadingWidget({super.key,this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(color:backgroundColor ?? Colors.black.withOpacity(0.5)),
          ),
          Center(
            child: Container(
              height: 140,
              width: 170,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoActivityIndicator(color: AppColors.primaryColor, radius: 16),
                  SizedBox(height: 16),
                  Text(
                    "Loading",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
