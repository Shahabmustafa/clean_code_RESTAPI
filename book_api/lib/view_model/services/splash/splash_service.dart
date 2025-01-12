import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_setup/config/widget/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:flutter_setup/ui/bottom_navigation_bar/book_list/book_list_screen.dart';

class SplashService{

  splash(BuildContext context){
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigationBarScreen()));
    });
  }
}