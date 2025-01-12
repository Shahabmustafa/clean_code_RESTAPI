import 'package:flutter_setup/view.dart';

extension FlutterToastMessageExtension on BuildContext{
  void toastMessage(var message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.white,
      textColor: AppColor.black,
      fontSize: 16.0,
    );
  }
}