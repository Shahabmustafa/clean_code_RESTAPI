import 'package:flutter_setup/data/network/network.dart';
import 'package:flutter_setup/model/book/books_model.dart';
import 'package:flutter_setup/model/book/specific_book_model.dart';
import 'package:flutter_setup/repository/book/book_api_repository.dart';
import 'package:flutter_setup/utils/api_url.dart';

class BookHttpApiRepository implements BookApiRepository{
  final _serviceApi = NetworkApiService();

  @override
  Future<BookListModel> fetchBookApi()async{
    dynamic response = await _serviceApi.getApi(ApiURL.bookList);
    return BookListModel.fromJson(response);
  }

  @override
  Future<SpecificBookModel> fetchSpecificBookApi(dynamic bookId)async{
    dynamic response = await _serviceApi.getApi("${ApiURL.specificBook}/$bookId");
    return SpecificBookModel.fromJson(response);
  }

}