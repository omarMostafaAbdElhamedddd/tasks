import 'package:flutter/material.dart';


class NotoficationScreen extends StatelessWidget {
  const NotoficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Notoifcations"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
         return  NotoficationItem ();
        },
    ));
  }
}
class NotoficationItem extends StatelessWidget {
  const NotoficationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Notofication title'),
        Text('your duedate for this task is on 4:15'),
        Text('9\2\2026 4:12')
      ],
    );
  }
}