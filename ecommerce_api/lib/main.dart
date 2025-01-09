import 'package:ecommerce_api/config/color/app_color.dart';
import 'package:ecommerce_api/view/login/login_screen.dart';
import 'package:ecommerce_api/view/splash/splash_screen.dart';
import 'package:ecommerce_api/view_model/product/product_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/component/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductListViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          scaffoldBackgroundColor: AppColor.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColor.white,
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.grey.shade500,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColor.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColor.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColor.primaryColor,
              ),
            ),

          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColor.primaryColor.withOpacity(0.5),
            selectionHandleColor: AppColor.primaryColor,
            cursorColor: AppColor.primaryColor,
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: AppColor.primaryColor,
          ),
          indicatorColor: AppColor.primaryColor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
