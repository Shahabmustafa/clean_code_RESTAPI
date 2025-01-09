import 'package:ecommerce_api/model/user/user_model.dart';
import 'package:ecommerce_api/repository/user/user_api_repository.dart';
import 'package:ecommerce_api/utils/app_url.dart';
import '../../data/network/network_api_service.dart';

class UserHttpApiRepository implements UserApiRepository{

  final _apiService = NetworkApiService();

  @override
  Future<UserModel> fetchSpecificUser()async{
    dynamic response = await _apiService.getApi(AppUrl.user+"/1");
    return UserModel.fromJson(response);
  }

}