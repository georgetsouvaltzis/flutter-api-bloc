
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:rest_api_ex/data/models/todo.dart';
import 'package:rest_api_ex/logic/todo_cubit/cubit/todo_cubit.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var controllerId = TextEditingController();
  var controllerTodo = TextEditingController();
  var controllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Todo;
    controllerId.text = args.id.toString();
    controllerTodo.text = args.todo!;
    controllerDescription.text = args.description!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Todo"),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          children: [
            TextFormField(
              controller: controllerId,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "ID"
              ),
            ),
            TextFormField(
              controller: controllerTodo,
              decoration: InputDecoration(
                  hintText: "Todo"
              ),
            ),
            TextFormField(
              controller: controllerDescription,
              decoration: InputDecoration(
                  hintText: "Description"
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical:40,horizontal: 40),
              child: Icon(Icons.add, color: Colors.green),
              onPressed: (){
                var td = Todo(id: int.parse(controllerId.text), todo: controllerTodo.text, description: controllerDescription.text);
                context.read<TodoCubit>().editTodo(td);
                Navigator.pop(context,true);
              },
            )
          ],
        ),
      ),
    );
  }
}
