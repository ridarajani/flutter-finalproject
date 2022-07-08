import 'package:final_project/screens/ChatScreen.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {

  final MessageModel message;

  MessageContainer({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.uid,style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 2,),
          Text(message.message,style: TextStyle(
            color: Colors.white
          ),)
        ],
      ),
    );
  }
}