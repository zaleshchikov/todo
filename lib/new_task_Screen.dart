import 'package:flutter/material.dart';
import 'main.dart';

class AddNewTaskScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          ),
          backgroundColor: appBarColor,
        ),
        body: Column(
            children: [
              //TextFiled
              //TextFiled
              //Container(кнопка)
            ]
        )
    );
  }
}
