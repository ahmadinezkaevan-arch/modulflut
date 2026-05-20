class ToDo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  ToDo(this.userId, this.id, this.title);

  ToDo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}