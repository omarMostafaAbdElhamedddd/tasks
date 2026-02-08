import 'package:flutter/material.dart';
import 'package:tasks/helper/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Profile",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20), 
              ),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mahmoud ",
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "mahmoudelshawy2010@gmail.com ",
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.grey
                  ),
                ),
                ],
            ),
          ),
          Text(
                  "change your username",
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.blue
                  ),
                ),
                Text(
                  "change your pasword",
                  style: TextStyle(
                    fontSize: 12, 
                    color: Colors.red
                  ),
                ),
              
        ],
      ),
    );
  }
}
