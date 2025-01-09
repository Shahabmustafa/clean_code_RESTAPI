
import 'dart:convert';

import 'package:ecommerce_api/model/token/user_model.dart';
import 'package:ecommerce_api/view_model/service/storage/local_storage.dart';
import 'package:flutter/foundation.dart';

/// Singleton Class
class SessionController{
  static final SessionController _session = SessionController._internal();
  LocalStorage sharedPreference =  LocalStorage();

  bool? isLogin;
  TokenModel user = TokenModel();

  factory SessionController(){
    return _session;
  }

  SessionController._internal(){
    isLogin = false;
  }

  Future<void> saveUserInPreference(dynamic user)async{
    sharedPreference.setValue("token", jsonEncode(user));
    sharedPreference.setValue("isLogin", 'true');
  }

  Future<void> logoutUserInPreference()async{
    sharedPreference.clearValue('token');
  }

  Future<void> getUserFromPreference()async{
    try{
      var userData = await sharedPreference.readValue('token');
      var isLogin = await sharedPreference.readValue('isLogin');
      if(userData.isNotEmpty){
        SessionController().user = TokenModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
}