import 'package:ecommerce_api/view/categori/categori_screen.dart';
import 'package:ecommerce_api/view/product/product_list_screen.dart';
import 'package:ecommerce_api/view/profille/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/app_color.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectIndex,
        children: const [
          ProductListScreen(),
          CategoryScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.grey.shade500,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.white,
        onTap: (value){
          selectIndex = value;
          setState(() {

          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
