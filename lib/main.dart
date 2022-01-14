import 'package:bloc_stream_task/bloc/todos_bloc.dart';
import 'package:bloc_stream_task/view/todos_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodosBloc todoService = TodosBloc(todos: []);
    return BlocProvider(
      create: (context) => todoService,
      child:  MaterialApp(
        home: TodosPage(todoStream:todoService.todos),
      ),
    );
  }
}