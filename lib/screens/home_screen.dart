import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_ex/logic/todo_cubit/cubit/todo_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        actions: [
          FlatButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context,"/add");
            },
          )
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        bloc: context.read<TodoCubit>()..fetchTodos(),
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index].todo!),
                  subtitle: Text(state.todoList[index].description!),
                  trailing: Wrap(
                    children: [
                     FlatButton(
                       onPressed: () {
                        Navigator.pushNamed(context, "/edit", arguments: state.todoList[index]);
                       },
                       child: Icon(Icons.edit, color: Colors.green)
                     ),
                     FlatButton(
                       onPressed: () {
                         context.read<TodoCubit>().deleteTodo(state.todoList[index].id!);
                       },
                       child: Icon(Icons.delete, color: Colors.red),
                     )
                    ],
                  )
                );
              },
              itemCount: state.todoList.length,
            );
          } else {
            return Center(
              child: Text((state as TodoLoadingError).errorMessage),
            );
          }
        },
      ),
    );
  }
}
