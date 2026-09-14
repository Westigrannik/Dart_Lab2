@override
class Todo {
  String get status => isDone ? 'Done' : 'in process';
  int id;
  String title;
  bool isDone;
  // this.title = title;
  // this.isDone = false;
  // int? = id;
  // String? title = title;
  // bool? isDone = false;
  // int id = 0;
  // String title = '';
  // bool isDone = false;
  // late int id;
  // late String title;
  // late bool isDone;
  Todo({required this.id, required this.title}) : isDone = false;
  String toString(){
  String mark = isDone ? '[x]' : '[ ]';
  return '$mark $id. $title ($status)';
}

void complete(){
  isDone = true;
}
}

