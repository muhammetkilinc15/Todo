import 'dart:convert';
import 'package:todo_app/model/todos.dart';
import 'package:http/http.dart' as http;

// TodoService sınıfı tanımlanıyor.
class TodoService {
  // API'den yapılacaklar listesini almak için kullanılacak URL
  final String url ="https://dummyjson.com/todos/";

  // Future ile asenkron işlemler yapabiliyoruz. await ve async var. ASP ile aynı
  // getTodos() metodu, API'den yapılacaklar listesini asenkron olarak alır.
  Future<List<Todo>> getTodos() async {
    // HTTP GET isteği yapılıyor ve yanıt bekleniyor
    final response = await http.get(Uri.parse(url)); //
    
    // Yanıtın gövdesi JSON olarak çözümleniyor
    List<dynamic> res = jsonDecode(response.body)["todos"];
    
    // Boş bir Todo listesi oluşturuluyor (dinamik olarak büyüyebilir)
    List<Todo> todos = List.empty(growable: true);
    
    // Her bir JSON nesnesi Todo modeline dönüştürülüyor ve listeye ekleniyor
    res.forEach((element) {
      todos.add(Todo.fromJson(element));
    });
    
    // Tamamlanmış Todo listesi geri döndürülüyor
    return todos;
  }
}
