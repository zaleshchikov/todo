import 'package:flutter/material.dart';
import 'main.dart';

class AddNewTaskScreen extends StatelessWidget{

  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

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
                fontWeight: FontWeight.bold, // жирность шрифта
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
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    filled: true,
                    fillColor: Color(0xfff2f3ff),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: detailController,
                  decoration: InputDecoration(
                      hintText: 'Detail',
                      filled: true,
                      fillColor: Color(0xfff2f3ff),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Container()
            ]
        )
    );
  }
}
