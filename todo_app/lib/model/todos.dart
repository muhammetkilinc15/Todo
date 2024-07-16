// Json ile veriler çekilecek model

class Todo{
  int id;
  String todo;
  bool completed;
  int userId;
  
  Todo({
        required this.id ,
        required this.todo, 
        required this.completed ,
        required this.userId,
      });
 
}