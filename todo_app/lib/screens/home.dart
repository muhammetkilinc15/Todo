import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/taskType.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/services/todo_service.dart';
import 'package:todo_app/todoItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
        title: "Study Lesson",
        description: "Study Sen211",
        isCompleted: false,
        type: Tasktype.note),
    Task(
        title: "Run 5 km",
        description: "Do egersize bro",
        isCompleted: false,
        type: Tasktype.calender),
    Task(
        title: "Go to Party",
        description: "Attend to party",
        isCompleted: false,
        type: Tasktype.constest),
  ];

  List<Task> Completed = [
    Task(
        title: "Game meetup",
        description: "Valorant Time",
        isCompleted: true,
        type: Tasktype.constest),
    Task(
        title: "Take out tash",
        description: "Clean my room ",
        isCompleted: true,
        type: Tasktype.calender)
  ];

  void addNewTask(Task task) {
    setState(() {
      todo.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    // Bugünün tarihini al
    DateTime now = DateTime.now();
    // Ay ismini formatla
    String formattedMonth = DateFormat.MMMM().format(now);
    // Gün ve yıl bilgilerini al
    int day = now.day;
    int year = now.year;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              // Header
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/images/header.png"),
                      fit: BoxFit.cover, // resim container alanına tam oturcak
                    ),
                    color: Colors.purple),
                width: deviceWidth, // Tel ekranı genişliği kadar
                height: deviceHeight / 3, // Tel ekranı uzunlugunun 1/3 kadar

                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        '$formattedMonth $day,  $year',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              // Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                          future: todoService.getTodos(false),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const CircularProgressIndicator();
                            }
                            ;
                            return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Todoitem(task: snapshot.data![index]);
                              },
                            );
                          })),
                ),
              ),
              // Completed Text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              // Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                          future: todoService.getTodos(true),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const CircularProgressIndicator();
                            }
                            ;
                            return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Todoitem(task: snapshot.data![index]);
                              },
                            );
                          })),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTask(
                        AddTask: (newTask) => addNewTask(newTask),
                      ),
                    ));
                  },
                  child: const Text("Add New Task"))
            ],
          ),
        ),
      ),
    );
  }
}
