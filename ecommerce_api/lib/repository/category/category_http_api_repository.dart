import 'package:ecommerce_api/model/product/product_model.dart';
import 'package:ecommerce_api/utils/app_url.dart';

import '../../data/network/network_api_service.dart';
import '../product/product_api_repository.dart';

class CategoryHttpApiRepository implements ProductApiRepository{
  final _apiService = NetworkApiService();
  @override
  Future<List<ProductModel>> fetchProductList() {
    // TODO: implement fetchProductList
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> fetchSpecificProduct(dynamic category)async{
    dynamic response = await _apiService.getApi("${AppUrl.category}/$category");
    return ProductModel.fromJson(response);
  }

  Future<List<ProductModel>> fetchCategory(dynamic category)async{
    dynamic response = await _apiService.getApi("${AppUrl.category}$category");
    return (response as List).map((e) => ProductModel.fromJson(e)).toList();
  }

}