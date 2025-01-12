import 'package:flutter/material.dart';
import 'package:flutter_setup/config/color/app_colors.dart';
import 'package:flutter_setup/view_model/services/splash/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashService().splash(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Center(child: Image.asset("assets/images/open-book.png",height: 200,width: 200,)),
          Text("Library Books",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColor.primaryColor),)
        ],
      ),
    );
  }
}
