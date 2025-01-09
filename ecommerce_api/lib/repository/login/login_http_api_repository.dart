

import 'package:ecommerce_api/repository/login/login_api_repository.dart';
import 'package:ecommerce_api/utils/app_url.dart';

import '../../data/network/network_api_service.dart';

class LoginHttpApiRepository implements LoginApiRepository{

  final _apiService = NetworkApiService();

  @override
  Future loginApi(var body)async{
    dynamic response = await _apiService.addApi(AppUrl.login, body);
    return response;
  }

}