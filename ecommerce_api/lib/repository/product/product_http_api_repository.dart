import 'package:ecommerce_api/data/network/network.dart';
import 'package:ecommerce_api/model/product/product_model.dart';
import 'package:ecommerce_api/repository/product/product_api_repository.dart';
import 'package:ecommerce_api/utils/app_url.dart';

class ProductHttpApiRepository implements ProductApiRepository{

  final _apiService = NetworkApiService();

  @override
  Future<List<ProductModel>> fetchProductList() async {
    dynamic response = await _apiService.getApi(AppUrl.product);
    return (response as List).map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<ProductModel> fetchSpecificProduct(dynamic id)async{
    dynamic response = await _apiService.getApi("${AppUrl.product}/$id");
    return ProductModel.fromJson(response);
  }

}