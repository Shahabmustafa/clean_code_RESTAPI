import 'package:flutter_setup/model/book/books_model.dart';
import 'package:flutter_setup/model/book/specific_book_model.dart';
import 'package:flutter_setup/repository/book/book_http_api_repository.dart';
import 'package:get/get.dart';
import '../../data/response/status.dart';

class BankViewModel extends GetxController{

  final _api = BookHttpApiRepository();

  final rxRequestStatus = Status.loading.obs ;
  final bookList = BookListModel().obs ;

  final specificBook = SpecificBookModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setBookList(BookListModel _value) => bookList.value = _value ;

  void setSpecificBook(SpecificBookModel _value) => specificBook.value = _value ;
  void setError(String _value) => error.value = _value ;

  void userListApi(){
     setRxRequestStatus(Status.loading);
     _api.fetchBookApi().then((value){
      setRxRequestStatus(Status.complete);
      setBookList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.error);

    });
  }

  void specificBookApi(dynamic bookId){
    setRxRequestStatus(Status.loading);
    _api.fetchSpecificBookApi(bookId).then((value){
      setRxRequestStatus(Status.complete);
      setSpecificBook(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.error);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userListApi();
  }
}