import 'package:flutter/material.dart';

class Tugas5 extends StatelessWidget {
  const Tugas5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Sample Code")),
        body: Center(child: Text("You have pressed the button  times.")),
        bottomNavigationBar: BottomAppBar(child: Container(height: 50.0)),
        floatingActionButton: FloatingActionButton(
          onPressed: () => 0,
          tooltip: 'increment counter',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
