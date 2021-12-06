import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:rest_api_ex/data/models/todo.dart';
import 'package:rest_api_ex/logic/todo_cubit/cubit/todo_cubit.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var controllerId = TextEditingController();
  var controllerTodo = TextEditingController();
  var controllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              context.read<TodoCubit>().addTodo(td);
              Navigator.pop(context,true);
            },
          )
      ],
    ),
    ),
    );
  }
}
