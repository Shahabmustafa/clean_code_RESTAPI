import 'package:ecommerce_api/data/response/api_response.dart';
import 'package:ecommerce_api/model/user/user_model.dart';
import 'package:ecommerce_api/repository/user/user_http_api.dart';
import 'package:flutter/cupertino.dart';

class SpecificUserViewModel extends ChangeNotifier{
  UserHttpApiRepository userHttpApi = UserHttpApiRepository();
  ApiResponse<UserModel> specificUser = ApiResponse.loading();

  setSpecificUser(ApiResponse<UserModel> response){
    specificUser = response;
    notifyListeners();
  }

  Future<void> fetchSpecificUser()async{
    setSpecificUser(ApiResponse.loading());
    try{
      await userHttpApi.fetchSpecificUser().then((value){
        setSpecificUser(ApiResponse.completed(value));
      }).onError((e,s){
        setSpecificUser(ApiResponse.error("${e.toString()}\n${s.toString()}"));
      });
    }catch(e){
      setSpecificUser(ApiResponse.error(e.toString()));
    }
  }

}