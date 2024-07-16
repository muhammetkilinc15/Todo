import 'package:flutter/material.dart';
import 'package:todo_app/constants/taskType.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todos.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Todo task;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed==true? const Color.fromARGB(255, 182, 181, 181) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              /* firebase işlemlerin de tekrar kullanılacak
            widget.task.type == Tasktype.note 
            ? Image.asset("lib/assets/images/category_1.png") 
            : widget.task.type == Tasktype.constest 
              ? Image.asset("lib/assets/images/category_2.png")
              : Image.asset("lib/assets/images/category_3.png"),
            */
            Image.asset("lib/assets/images/category_1.png"),
            Expanded(
              child: Column(children: [
                Text(
                  widget.task.todo!,
                  style:
                       TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        decoration: widget.task.completed== true? TextDecoration.lineThrough : TextDecoration.none),
                ),
                 Text("User : ${widget.task.userId}" ,style: TextStyle(decoration: widget.task.completed== true? TextDecoration.lineThrough : TextDecoration.none),)
              ],
                         ),
            ),
            Checkbox(
                value: isCheck,
                onChanged: (val) => {
                      setState(() {
                        isCheck = val!;
                        widget.task.completed = !widget.task.completed!;  
                      })
                    }),
          ],
        ),
      ),
    );
  }
}
