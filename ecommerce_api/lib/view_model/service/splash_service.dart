import 'dart:async';
import 'package:ecommerce_api/config/component/bottom_navigation_bar.dart';
import 'package:ecommerce_api/view/login/login_screen.dart';
import 'package:ecommerce_api/view_model/service/session/session_controller.dart';
import 'package:flutter/material.dart';

class SplashService{


  static isSplash(BuildContext context){

    SessionController().getUserFromPreference().then((value)async{
      if(SessionController().isLogin!){
        Timer(Duration(seconds: 2), (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()), (route) => false);
        });
      }else{
        Timer(Duration(seconds: 2), (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
        });
      }
    }).onError((e,s){
      Timer(Duration(seconds: 2), (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
      });
    });
  }
}