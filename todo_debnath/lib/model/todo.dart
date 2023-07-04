class ToDo {
  int? id;
  String? title;
  bool isDone = false;

  ToDo({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: 0, title: 'Check sth0', isDone: true),
      ToDo(id: 1, title: 'Check sth1', isDone: true),
      ToDo(id: 2, title: 'Check sth2'),
      ToDo(id: 3, title: 'Check sth3'),
      ToDo(id: 4, title: 'Check sth4'),
      ToDo(id: 5, title: 'Check sth5'),
    ];
  }
}
