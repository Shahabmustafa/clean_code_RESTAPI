import 'package:flutter_setup/model/book/books_model.dart';
import 'package:flutter_setup/model/book/specific_book_model.dart';

abstract class BookApiRepository{
  Future<BookListModel> fetchBookApi();
  Future<SpecificBookModel> fetchSpecificBookApi(dynamic bookId);
}