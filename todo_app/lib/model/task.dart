import 'package:todo_app/constants/taskType.dart';

class Task{
  final String name ;
  final String description;
  final bool isCompleted;
  Tasktype type;
  Task({
    required this.name,
    required this.description,
    required this.isCompleted,
    required this.type
  });
 

}