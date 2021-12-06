import 'package:dio/dio.dart';
import 'package:rest_api_ex/data/models/todo.dart';

class TodoRepository {
  List<Todo>? todoList = [];
  Dio dio = Dio();

  Future<List<Todo>?>? fetchTodos() async {
    final response = await dio.get('http://10.0.2.2:8080/todos');
    if (response.statusCode == 200) {
      var loadedTodo = <Todo>[];
      response.data.forEach((todo) {
        Todo todoModel = Todo.fromJson(todo);
        loadedTodo.add(todoModel);
        todoList = loadedTodo;
        return todoList;
      });
    }
    return todoList;
  }
  Future<void> deleteTodo(int id) async {
    await dio.delete('http://10.0.2.2:8080/delete-todo/' + id.toString());
  }

  Future<void> addTodo(Todo todo) async {
    await dio.post(
     'http://10.0.2.2:8080/add-todo',
     data: todo.toJson()
    );
  }

  Future<void> editTodo(Todo todo) async {
    await dio.put("http://10.0.2.2:8080/update-todo",
        data: todo.toJson());
  }
}
