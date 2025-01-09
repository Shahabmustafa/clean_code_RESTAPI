import 'package:ecommerce_api/model/product/product_model.dart';

abstract class ProductApiRepository {
  Future<List<ProductModel>> fetchProductList();
  Future<ProductModel> fetchSpecificProduct(dynamic id);
}