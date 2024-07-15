import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/todoItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> todo = ["Study Lesson", "Run 5 km", "Go to Party"];
List<String> Completed = ["Game meetup", "Take out tash"];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      // safe Area ile bildirimler tusuna yanlsıkla gitme engelledik
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

                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 20, 2022",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
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
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return Todoitem(title: todo[index]);
                      },
                    ),
                  ),
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
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: Completed.length,
                        itemBuilder: (context, index) {
                      return Todoitem(title: Completed[index]);
                    },
                  )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Add New Task"))
            ],
          ),
        ),
      ),
    );
  }
}
