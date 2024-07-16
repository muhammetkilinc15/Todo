import 'package:todo_app/constants/taskType.dart';

class Task{
  final String title ;
  final String description;
  bool isCompleted;
  Tasktype type;
  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.type
  });
 

}