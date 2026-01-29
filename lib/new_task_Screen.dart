import 'package:flutter/material.dart';
import 'main.dart';

class AddNewTaskScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; // высота экрана в пикселях
    var width = MediaQuery.of(context).size.width; // ширина экрана

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
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context); // удаляем верхний элемент стека экранов
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          ),
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
                  borderRadius: BorderRadius.circular(20),
                ),
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
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO добавить валидацию
              var newTask = Task(titleController.text, detailController.text);
              tasks.add(newTask);
              Navigator.pushReplacement( // переход на экран tasksScreen
                context,
                MaterialPageRoute(builder: (context) => TasksScreen()),
              );
            },
            child: Center(
              // кнопка добавления задачи
              child: Container(
                width: width * 0.9,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
