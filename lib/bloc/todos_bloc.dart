import 'package:bloc/bloc.dart';
import 'package:bloc_stream_task/model/todo_model.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'todos_event.dart';

class TodosBloc extends Bloc<TodosEvent, List<TodosModel>> {
  final _todosList = BehaviorSubject.seeded(<TodosModel>[]);

  ValueStream<List<TodosModel>> get todos => _todosList.stream;

  TodosBloc({required List<TodosModel> todos}) : super(todos) {
    on<AddTodos>(_onAddTodos);
    on<DeleteTodos>(_onDeleteTodos);
    on<UpdateTodos>(_onUpdateTodos);
  }

  void _onAddTodos(AddTodos event, Emitter<List<TodosModel>> emit) {
    final currentTodos = state;
    currentTodos.add(event.newTodo);
    _todosList.add(currentTodos);
  }

  void _onDeleteTodos(DeleteTodos event, Emitter<List<TodosModel>> emit) {
    final currentTodos = state;
    currentTodos.removeWhere((element) => element.id == event.todoId);
    _todosList.add(currentTodos);
  }

  void _onUpdateTodos(UpdateTodos event, Emitter<List<TodosModel>> emit) {
    List<TodosModel> currentTodos = _todosList.value;
    currentTodos = currentTodos.map((item) {
      if (item.id == event.todoId) {
        item.isComplete = !item.isComplete;
      }
      return item;
    }).toList();
    _todosList.add(currentTodos);
  }

}
