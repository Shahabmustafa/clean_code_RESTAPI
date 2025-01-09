import 'package:ecommerce_api/model/user/user_model.dart';

abstract class UserApiRepository{
  Future<UserModel> fetchSpecificUser();
}