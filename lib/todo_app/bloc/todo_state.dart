import 'package:equatable/equatable.dart';

class ToDoState extends Equatable {
  List<String> todos;

  ToDoState({this.todos = const []});

  ToDoState copyWith({List<String>? todos}) => ToDoState(todos: todos ?? this.todos);

  @override
  List<Object?> get props => [todos];
}
