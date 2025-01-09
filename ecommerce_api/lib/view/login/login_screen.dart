import 'package:ecommerce_api/config/color/app_color.dart';
import 'package:ecommerce_api/data/response/api_response.dart';
import 'package:ecommerce_api/view_model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/component/bottom_navigation_bar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ChangeNotifierProvider<LoginViewModel>(
        create: (BuildContext context) => LoginViewModel(),
        child: Consumer<LoginViewModel>(
          builder: (context,login,child){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login your Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),),
                  SizedBox(height: kTextTabBarHeight,),
                  Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          cursorColor: AppColor.primaryColor,
                          cursorHeight: 16,
                          validator: (value){
                            return value!.isEmpty ? "Please Enter Email" : "";
                          },
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(height: size.height * 0.01,),
                        TextFormField(
                          cursorColor: AppColor.primaryColor,
                          cursorHeight: 16,
                          obscureText: login.passwordVisibility,
                          validator: (value){
                            return value!.isEmpty ? "Please Enter Password" :
                            value.length < 8 ? "Enter 8 digits Password" : "";
                          },
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () => login.setVisibility(),
                              icon: Icon(login.passwordVisibility ? Icons.visibility_off : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02,),
                        ElevatedButton(
                          onPressed: (){
                            login.fetchUserLogin(context).then((value){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),);
                            }).onError((e,s){
                              print("error: $e >>>>>> $s");
                            });
                          },
                          child: login.loginLoading ? Center(child: SizedBox(height: 20,width: 20,child: CircularProgressIndicator(color: AppColor.white,))) : Text("Login"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
