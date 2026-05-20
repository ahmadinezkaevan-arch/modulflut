import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ToDo.dart';

class HttpService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<ToDo>> getToDo() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => ToDo.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}