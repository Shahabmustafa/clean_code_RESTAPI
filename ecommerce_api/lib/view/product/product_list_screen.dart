import 'package:ecommerce_api/config/color/app_color.dart';
import 'package:ecommerce_api/config/component/exception_widget/custom_exception.dart';
import 'package:ecommerce_api/data/response/status.dart';
import 'package:ecommerce_api/utils/utils.dart';
import 'package:ecommerce_api/view/product/specific_product_screen.dart';
import 'package:ecommerce_api/view_model/product/product_list_view_model.dart';
import 'package:ecommerce_api/view_model/service/session/session_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/login_screen.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
        actions: [
          IconButton(
            onPressed: ()async{
              await SessionController().logoutUserInPreference();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: RefreshIndicator(
        color: AppColor.primaryColor,
        backgroundColor: AppColor.white,
        onRefresh: ()async{
          await Provider.of<ProductListViewModel>(context, listen: false).fetchProductList();
        },
        child: ChangeNotifierProvider<ProductListViewModel>(
          create: (BuildContext context) => ProductListViewModel()..fetchProductList(),
          child: Consumer<ProductListViewModel>(
            builder: (context,value,child){
              switch(value.productList.status){
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.error:
                  switch(value.productList.message){
                    case "No internet connection":
                      return CustomException(
                        icon: Icons.wifi_off_outlined,
                        message: value.productList.message.toString(),
                        onPressed: ()async{
                          await Provider.of<ProductListViewModel>(context, listen: false).fetchProductList();
                        },
                      );
                    default:
                      return CustomException(
                        icon: Icons.error,
                        message: value.productList.message.toString(),
                        onPressed: ()async{
                          await Provider.of<ProductListViewModel>(context, listen: false).fetchProductList();
                        },
                      );
                  }
                case Status.complete:
                  return ListView.builder(
                    itemCount: value.productList.data!.length,
                    itemBuilder: (context, index) {
                      var product = value.productList.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificProductScreen(id: int.parse(product.id.toString()),)));
                          },
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width * 1,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.grey.shade400,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer,
                                    offset: Offset(0.1, 0.1),
                                  ),
                                ]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Row(
                                    spacing: 10,
                                    children: [
                                      Utils.cachedImageNetwork(product.image.toString(), 100, 100),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.title.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              product.category.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "Price. \$${product.price.toString()}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Icon(CupertinoIcons.star_fill,color: Colors.orangeAccent,),
                                    Text(
                                      product.rating!.rate.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                default:
                  return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
