import 'package:flutter/material.dart';
import 'package:todo/new_task_Screen.dart';

const appBarColor = Color(0xff9395D3);
const backgroundColor = Color(0xffD6D7EF);
const bottomBarColor = Color(0xffFFFFFF);
List<Task> tasks = [
  Task('Задача 1', 'detail'),
  Task('Задача 2', 'detail'),
  Task('Задача 3', 'detail'),
];

List completedTasks = [
  Task('Задача 4', 'detail'),
];

class Task {
  String title;
  String detail;

  Task(this.title, this.detail);
}

void main() {
  runApp(
    // функция для начала работы приложения
    MaterialApp(
      // функция, определяющая контекст приложения
      debugShowCheckedModeBanner:
          false, // флаг, чтобы убрать сообщение о режиме дебага
      home: TasksScreen(),
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
        backgroundColor: appBarColor,
        shape: CircleBorder(), // форма
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 20),
      ),
      body: TodoTilesList(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomBarColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Задачи'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Выполнено'),
        ],
      ),
    );
  }
}

class CompletedTilesList extends StatelessWidget {
  const CompletedTilesList({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; // высота экрана в пикселях
    var width = MediaQuery.of(context).size.width; // ширина экрана

    return ListView.builder(
      itemCount: completedTasks.length,
      itemBuilder: (context, index) => Center(
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
                        completedTasks[index].title.toUpperCase(),
                        style: TextStyle(
                          color: appBarColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        completedTasks[index].detail,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}


class TodoTilesList extends StatefulWidget { // изменяемый виджет
  @override
  State<TodoTilesList> createState() => _TodoTilesListState();
}

class _TodoTilesListState extends State<TodoTilesList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; // высота экрана в пикселях
    var width = MediaQuery.of(context).size.width; // ширина экрана
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => Center(
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
                        tasks[index].title.toUpperCase(),
                        style: TextStyle(
                          color: appBarColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tasks[index].detail,
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
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            tasks.remove(tasks[index]);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: appBarColor,
                          size: height * 0.03,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          var task = tasks[index];
                          tasks.remove(task);
                          completedTasks.add(task);
                          setState(() {

                          });
                        },
                        child: Icon(
                          Icons.check_circle_outlined,
                          color: appBarColor,
                          size: height * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
