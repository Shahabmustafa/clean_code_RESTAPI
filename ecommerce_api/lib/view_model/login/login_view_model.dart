import 'package:ecommerce_api/repository/login/login_http_api_repository.dart';
import 'package:ecommerce_api/view_model/service/session/session_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{
  LoginHttpApiRepository loginHttpApiRepository = LoginHttpApiRepository();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;
  setVisibility(){
    _passwordVisibility =! _passwordVisibility;
    notifyListeners();
  }

  bool _loginLoading = false ;
  bool get loginLoading => _loginLoading ;

  setLoginLoading(bool value){
    _loginLoading = value;
    notifyListeners();
  }

  Future<void> fetchUserLogin(BuildContext context)async{
    Map data = {
      "username" : "mor_2314",
      "password" : "83r5^_",
      // "username" : email.text.trim(),
      // "password" : password.text.trim(),
    };
    setLoginLoading(true);
    try{
      final response = await loginHttpApiRepository.loginApi(data);
      await SessionController().saveUserInPreference(response);
      if (kDebugMode) {
        print("User Response : ${response.toString()}");
      }
      await SessionController().getUserFromPreference();
      setLoginLoading(false);
      return response;
    }catch(e){
      setLoginLoading(false);
      print("Show Catch Error >>>> " + e.toString());
    }
  }

}