import 'package:lab2_todo_vovk/todo.dart';

void main() {
  Todo task1 = Todo(id: 1, title: 'Купить продукты');
  Todo task2 = Todo(id: 1, title: 'Сделать зарядку');
  task1.complete();
  print(task1);
  print(task2);

}