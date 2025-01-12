

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/ui/bottom_navigation_bar/book_list/book_list_screen.dart';
import 'package:flutter_setup/ui/bottom_navigation_bar/search/book_search_screen.dart';

import '../../color/app_colors.dart';

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
          BookListScreen(),
          BookSearchScreen(),
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
            icon: Icon(CupertinoIcons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: "",
          ),
        ],
      ),
    );
  }
}
