part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class AddTodos extends TodosEvent {
  const AddTodos({required this.newTodo});
  final TodosModel newTodo;

  @override
  List<Object> get props => [newTodo];
}

class UpdateTodos extends TodosEvent {
  const UpdateTodos({required this.todoId});
  final String todoId;

  @override
  List<Object> get props => [todoId];
}

class DeleteTodos extends TodosEvent {
  const DeleteTodos({required this.todoId});
  final String todoId;

  @override
  List<Object> get props => [todoId];
}
