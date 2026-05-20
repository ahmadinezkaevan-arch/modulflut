import 'package:flutter/material.dart';
import '../service/http_service.dart';
import '../models/ToDo.dart';
import 'todo_detail.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  int count = 0;
  late List<ToDo> todos;
  late HttpService service;

  Future initialize() async {
    todos = await service.getToDo();
    setState(() {
      count = todos.length;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: EdgeInsets.all(12),

              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  todos[index].id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              title: Text(
                todos[index].title.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text("User ID: ${todos[index].userId}"),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    todos[index].completed == true
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: todos[index].completed == true
                        ? Colors.green
                        : Colors.red,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios, size: 14),
                ],
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToDoDetail(todos[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}