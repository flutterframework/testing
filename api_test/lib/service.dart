import 'package:api_test/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class BookApi {
  Future<List<Book>> books();
}

class BookService implements BookApi {
  Future<List<Book>> books() async {
    var url = Uri.parse('http://localhost/flutter/book.php');
    var response = await http.get(url);

    //print(response.body);
    if (response.statusCode == 200) {
      final listResponse = convert.jsonDecode(response.body) as List;
      List<Book> books = listResponse
          .map(
            (e) => Book(
              title: e['title'],
              author: e['author'],
            ),
          )
          .toList();
      return books;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
