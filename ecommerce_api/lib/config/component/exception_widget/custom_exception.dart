import 'package:ecommerce_api/config/color/app_color.dart';
import 'package:flutter/material.dart';

class CustomException extends StatelessWidget {
  const CustomException({required this.icon,required this.message,this.onPressed,super.key});
  final String message;
  final VoidCallback? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: AppColor.primaryColor,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "${message}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: onPressed,
            child: Text("Refresh"),
          )
        ],
      ),
    );
  }
}
