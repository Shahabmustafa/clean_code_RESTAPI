import 'package:flutter_setup/view.dart';
import 'package:flutter_setup/view_model/bank/bank_view_model.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.lightTheme,
      home: const SplashScreen(),
      initialBinding: BindingsBuilder((){
        Get.put(BankViewModel());
      }),
    );
  }
}