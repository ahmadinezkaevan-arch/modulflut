import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Image(
        image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
        ),
      ),
    );
  }
}
