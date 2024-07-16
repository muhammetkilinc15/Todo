import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/taskType.dart';
import 'package:todo_app/model/task.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key,required this.AddTask});
  final void Function (Task newTask) AddTask;
  // passing function as paramater

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Tasktype tasktype = Tasktype.note;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/add_new_task_header.png"),
                      fit: BoxFit.cover),
                ),
                width: deviceWidth,
                height: deviceHeight / 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Bunu pop ederek bir önceki sayfaya döneceğiz
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Add new task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: const Text("Task title")),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     const Text("Category"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                        setState(() {
                          tasktype= Tasktype.note;
                        });
                      },
                      child: Image.asset("lib/assets/images/category_1.png", width: 50, height: 50),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                          setState(() {
                          tasktype= Tasktype.calender;
                        });
                      },
                      child: Image.asset("lib/assets/images/category_2.png", width: 50, height: 50),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category selected"),
                          ),
                        );
                          setState(() {
                          tasktype= Tasktype.constest;
                        });
                      },
                      child: Image.asset("lib/assets/images/category_3.png", width: 50, height: 50),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 10),
                child:  Row(
                  children: [
                    Expanded(
                      child: Column(children: [
                        const Text("Date"),
                        Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller:  dateController,
                            decoration: const InputDecoration(filled: true,
                            fillColor: Colors.white),
                          )
                        )
                      
                      ],),
                    ),
                      Expanded(
                      child: Column(children: [
                        const Text("Time"),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField( 
                            controller: timeController,
                            decoration: const  InputDecoration(filled: true,
                            fillColor: Colors.white),))
                      
                            ],
                          ),
                      ),             
                  ],
                  
                ),
              ),
              const  Padding(
                padding: EdgeInsets.only(top: 10),
                child:  Text("Description")),
                SizedBox(
                    height: 300,
                    child: TextField(
                      controller: descriptionController,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(filled: true,fillColor: Colors.white,isDense: true),
                    )
                  )
              ,ElevatedButton(onPressed: (){
                Task newTask =Task(title: titleController.text, description: descriptionController.text, isCompleted: false, type: tasktype);
                widget.AddTask(newTask);  
                Navigator.pop(context);
              }, child: Text("Save") )
            ],
            
          ),
        ),
      ),
    );
  }
}
