import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/helper/color.dart';


class NotoficationScreen extends StatelessWidget {
  const NotoficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text("Notoifcations", style: TextStyle(
            fontSize: 16
          ),),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset("assets/notification.png", height: 24),
            )
          ],
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SvgPicture.asset("assets/noData.svg", height: 130,),
              SizedBox(height: 12,),
              Text("No notofications added yet!"),
              ],
              ),
        ));
        // ListView.builder(
        //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   itemBuilder: (context, index) {
        //     return  NotoficationItem ();
        //   },
        // ));
  }
}
class NotoficationItem extends StatelessWidget {
  const NotoficationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12 , horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withAlpha(100))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Notofication title', style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 8,),
          Text('your duedate for this task is on 4:15', style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black.withAlpha(170)
          ),),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('9/2/2026 4:12', style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 12
              ),),
            ],
          )
        ],
      ),
    );
  }
}