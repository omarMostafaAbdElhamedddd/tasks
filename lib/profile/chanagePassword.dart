import 'package:flutter/material.dart';
class ChanagePassword extends StatelessWidget {
  const ChanagePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Text('Chanage Password' ,style: TextStyle(
      fontSize : 16
    ),),
    

  ),
    );
  }
}
