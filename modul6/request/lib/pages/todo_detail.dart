import 'package:flutter/material.dart';
import '../models/ToDo.dart';

class ToDoDetail extends StatelessWidget {
  final ToDo todo;

  ToDoDetail(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title.toString()),
      ),
      body: Padding(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          todo.title.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      SizedBox(height: 20),

      Row(
        children: [
          Icon(Icons.person),
          SizedBox(width: 8),
          Text("User ID: ${todo.userId}"),
        ],
      ),

      SizedBox(height: 10),

      Row(
        children: [
          Icon(
            todo.completed == true
                ? Icons.check_circle
                : Icons.cancel,
            color: todo.completed == true
                ? Colors.green
                : Colors.red,
          ),
          SizedBox(width: 8),
          Text(
            todo.completed == true ? "Completed" : "Not Completed",
          ),
        ],
      ),
    ],
  ),
),
    );
  }
}