import 'dart:convert';
import 'dart:ffi';
import 'package:todo_app/model/todos.dart';
import 'package:http/http.dart' as http;

// TodoService sınıfı tanımlanıyor.
class TodoService {
  // API'den yapılacaklar listesini almak için kullanılacak URL
  final String url ="https://dummyjson.com/todos/";
  final String postUrl ="https://dummyjson.com/todos/add";
  // Future ile asenkron işlemler yapabiliyoruz. await ve async var. ASP ile aynı
  // getTodos() metodu, API'den yapılacaklar listesini asenkron olarak alır.
  Future<List<Todo>> getTodos(bool complete) async {
    // HTTP GET isteği yapılıyor ve yanıt bekleniyor
    final response = await http.get(Uri.parse(url)); //
    
    // Yanıtın gövdesi JSON olarak çözümleniyor
    List<dynamic> res = jsonDecode(response.body)["todos"];
    
    // Boş bir Todo listesi oluşturuluyor (dinamik olarak büyüyebilir)
    List<Todo> todos = List.empty(growable: true);
    
    // Her bir JSON nesnesi Todo modeline dönüştürülüyor ve listeye ekleniyor
    res.forEach((element) {
      Todo task = Todo.fromJson(element);
      if (task.completed==complete){
        todos.add(task);
      }
    });
    
    // Tamamlanmış Todo listesi geri döndürülüyor
    return todos;
  }

  Future<String> AddTodo(Todo newTodo) async{
    final response = await http.post(
      Uri.parse(postUrl),
      body: json.encode(newTodo.toJson()),
      headers: <String,String>{"content-type":"application/json",}
      );
    print(response.body);
    return response.body;
  }
}
