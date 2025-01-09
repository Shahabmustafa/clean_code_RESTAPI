import 'package:ecommerce_api/repository/category/category_http_api_repository.dart';
import 'package:flutter/foundation.dart';
import '../../data/response/api_response.dart';
import '../../model/product/product_model.dart';

class CategoryViewModel extends ChangeNotifier{
  CategoryHttpApiRepository categoryHttpApiRepository = CategoryHttpApiRepository();
  ApiResponse<List<ProductModel>> category = ApiResponse.loading();

  setCategory(ApiResponse<List<ProductModel>> response){
    category = response;
    notifyListeners();
  }

  Future<void> fetchSpecificProduct(String category)async{
    setCategory(ApiResponse.loading());
    try{
      await categoryHttpApiRepository.fetchCategory(category).then((value){
        setCategory(ApiResponse.completed(value));
        print(value);
      }).onError((error,s){
        setCategory(ApiResponse.error(error.toString()));
        print(error.toString());
        print(s.toString());
      });
    }catch(e){
      setCategory(ApiResponse.error(e.toString()));
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

}