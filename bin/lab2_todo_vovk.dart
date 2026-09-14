import 'package:lab2_todo_vovk/todo.dart';
import 'dart:io';

void printMenu(){
  print('');
  print('ToDo list');
  print('add - add problem');
  print('list - show every problem');
  print('done - mark as completed');
  print('delete - delete problem');
  print('exit - exit?');
}

void addTodo(List<Todo> todos){
  stdout.write('name of problem: ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty){
    print('Error: name can not be empty');
    return;
  }

int newId = todos.isEmpty ? 1 : todos.last.id +1;
todos.add(Todo(title: input.trim()));
print('Problem added!');  
}

void listTodos(List<Todo> todos) {
  if (todos.isEmpty){
    print('list of problems is empty');
    return;
  }

  print('');
  for (var todo in todos){
    print(todo);
  }
}

void completeTodo(List<Todo> todos){
  stdout.write('ID problem: ');
  String? input = stdin.readLineSync();

  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null){
    print('Error: add number');
    return;
  }
  for (var todo in todos){
    if (todo.id == id){
      todo.complete();
      print('Problem marked as complete!');
      return;
    }
  }

  print('Problem with ID $id is not found');
}

void deleteTodo(List<Todo> todos) {
  stdout.write('ID problem: ');
  String? input = stdin.readLineSync();

  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print('Error: enter the number');
    return;
  }

  for (int i = 0; i < todos.length; i++) {
    if (todos[i].id == id){
      todos.removeAt(i);
      print('Задач удалена!');
      return;
    }
  }
  print('Problem with ID $id is not found');
}

void main() {
  List<Todo> todos = [];
  printMenu();

  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null) continue;
    String command = input.trim().toLowerCase();
    if (command.isEmpty) continue;
    switch (command){
      case 'add': addTodo(todos); break;
      case 'list': listTodos(todos); break;
      case 'done': completeTodo(todos); break;
      case 'delete': deleteTodo(todos); break;
      case 'exit': print('Goodbye!'); return;
      default: printMenu(); print('Unknown command.');
    }
  }
}