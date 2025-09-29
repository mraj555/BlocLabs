import 'package:bloc/bloc.dart';
import 'package:bloclabs/todo_app/bloc/todo_event.dart';
import 'package:bloclabs/todo_app/bloc/todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> _todos = [];

  ToDoBloc() : super(ToDoState()) {
    on<AddToDoEvent>(_onAddToDoEvent);
    on<RemoveToDoEvent>(_onRemoveToDoEvent);
  }

  void _onAddToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    _todos.add(event.task);

    ///One way to add element in list
    // emit(state.copyWith(todos: [...state.todos, event.task]));

    ///Another way to add element in list using create new list
    emit(state.copyWith(todos: List.from(_todos)));
  }

  void _onRemoveToDoEvent(RemoveToDoEvent event, Emitter<ToDoState> emit) {
    _todos.remove(event.task);
    emit(state.copyWith(todos: List.from(_todos)));
  }
}
