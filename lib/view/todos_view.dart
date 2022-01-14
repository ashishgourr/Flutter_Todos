import 'package:bloc_stream_task/bloc/todos_bloc.dart';
import 'package:bloc_stream_task/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todos App"),
        ),
        body: BlocBuilder<TodosBloc, List<TodosModel>>(
          builder: (context, todos) {
            return Center(
              child: ((todos).isEmpty
                  ? const Text("No todos found")
                  : ListView.builder(
                      itemCount: todos != null ? todos.length : 0,
                      itemBuilder: (context, index) {
                        final todo = (todos ?? [])[index];
                        return Card(
                          margin: const EdgeInsets.all(16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                    value: todo.isComplete,
                                    onChanged: (value) =>
                                        BlocProvider.of<TodosBloc>(context)
                                            .add(UpdateTodos(todoId: todo.id))),
                                Text(todo.title),
                                IconButton(
                                    onPressed: () =>
                                        BlocProvider.of<TodosBloc>(context)
                                            .add(DeleteTodos(todoId: todo.id)),
                                    icon: const Icon(Icons.delete))
                              ],
                            ),
                          ),
                        );
                      })),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => BlocProvider.of<TodosBloc>(context).add(AddTodos(
              newTodo: TodosModel(
                  id: UniqueKey().toString(),
                  title: "New flutter task",
                  isComplete: false))),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
