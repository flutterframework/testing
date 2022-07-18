import 'package:api_test/model.dart';
import 'package:api_test/service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var book_service = BookService();

  test('book api', () async {
    final result = await book_service.books();
    print(" test $result");

    expect(result.isNotEmpty, true);
    expect(result, isA<List<Book>>());
  });
}
