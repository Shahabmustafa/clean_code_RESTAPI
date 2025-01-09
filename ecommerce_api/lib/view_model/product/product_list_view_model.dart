import 'package:ecommerce_api/data/response/api_response.dart';
import 'package:ecommerce_api/model/product/product_model.dart';
import 'package:ecommerce_api/repository/product/product.dart';
import 'package:flutter/foundation.dart';

class ProductListViewModel extends ChangeNotifier{
  ProductHttpApiRepository productHttpApiRepository = ProductHttpApiRepository();
  ApiResponse<List<ProductModel>> productList = ApiResponse.loading();
  ApiResponse<ProductModel> specificProduct = ApiResponse.loading();

  setProductList(ApiResponse<List<ProductModel>> response){
    productList = response;
    notifyListeners();
  }

  setSpecificProduct(ApiResponse<ProductModel> response){
    specificProduct = response;
    notifyListeners();
  }

  Future<void> fetchProductList() async {
    setProductList(ApiResponse.loading());
    try {
      await productHttpApiRepository.fetchProductList().then((value){
        setProductList(ApiResponse.completed(value));
        print(value.toString());
      }).onError((error,s){
        setProductList(ApiResponse.error(error.toString()));
        print(">>>> Check Error what typr of error" +error.toString());
        // print()
      });
    } catch (error) {
      setProductList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> fetchSpecificProduct(int id)async{
    setSpecificProduct(ApiResponse.loading());
    try{
      await productHttpApiRepository.fetchSpecificProduct(id).then((value){
        setSpecificProduct(ApiResponse.completed(value));
        print(value);
      }).onError((error,s){
        setSpecificProduct(ApiResponse.error(error.toString()));
        print(error.toString());
        print(s.toString());
      });
    }catch(e){
      setSpecificProduct(ApiResponse.error(e.toString()));
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }


}