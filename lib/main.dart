import 'package:flutter/material.dart';
import 'package:todo/new_task_Screen.dart';

const appBarColor = Color(0xff9395D3);
const backgroundColor = Color(0xffD6D7EF);
const bottomBarColor = Color(0xffFFFFFF);

void main() {
  runApp(
    // функция для начала работы приложения
    MaterialApp(
      // функция, определяющая контекст приложения
      debugShowCheckedModeBanner:
          false, // флаг, чтобы убрать сообщение о режиме дебага
      home: AddNewTaskScreen()
    ),
  );
}

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // определяет положение блоков экрана
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'TODO APP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold, // жирность шрифта
          ),
        ),
        actions: [
          // TODO: заменить на изображение из figma
          Container(
            padding: EdgeInsets.only(right: 20), // внутренние отступы
            child: Icon(Icons.calendar_month, color: Colors.white, size: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // TODO: изменить форму кнопки
        backgroundColor: appBarColor,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white, size: 20),
      ),
      body: TodoTile(),
      // TODO: создать column с тремя карточками
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomBarColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Задачи'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Выполнено',
          ),
        ],
      ),
    );
  }
}


class TodoTile extends StatelessWidget {
  // класс задачи
  // TODO: создать конструктор так, чтобы передавать title и detail
  String title = 'title';
  String detail = 'detail';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; // высота экрана в пикселях
    var width = MediaQuery.of(context).size.width; // ширина экрана
    return Center(
      // центрирование содержимого
      child: Card(
        elevation: 5,
        child: Container(
          height: height * 0.13, // 13% от высоты экрана
          width: width * 0.9, // 90% от ширины экрана
          decoration: BoxDecoration(
            color: Colors.white, // белый цвет контейнера
            borderRadius: BorderRadius.circular(
              20,
            ), // скругленные края контейнера
          ),
          child: Row(
            // выстраивание виджетов по горизонтали
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // распределяет свободное пространство между виджетами
                  // а так же перед первым и после последнего виджета
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: appBarColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detail,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.edit, color: appBarColor, size: height * 0.03),
                    Icon(Icons.delete, color: appBarColor, size: height * 0.03),
                    Icon(
                      Icons.check_circle_outlined,
                      color: appBarColor,
                      size: height * 0.03,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
