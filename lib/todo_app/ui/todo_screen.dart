import 'package:bloclabs/todo_app/bloc/todo_bloc.dart';
import 'package:bloclabs/todo_app/bloc/todo_event.dart';
import 'package:bloclabs/todo_app/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("ToDo App"), centerTitle: true),
        body: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state.todos.isEmpty) {
              return Center(child: Text("No ToDos found"));
            }
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index]),
                  trailing: IconButton(
                    onPressed: () => context.read<ToDoBloc>().add(RemoveToDoEvent(task: state.todos[index])),
                    icon: Icon(Icons.delete_rounded),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final int _length = context.read<ToDoBloc>().state.todos.length;
            context.read<ToDoBloc>().add(AddToDoEvent(task: 'Task: ${_length + 1}'));
          },
          child: Icon(Icons.add_rounded, size: 25),
        ),
      ),
    );
  }
}
