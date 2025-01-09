import 'package:ecommerce_api/data/response/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../view_model/product/product_list_view_model.dart';

class SpecificProductScreen extends StatefulWidget {
  const SpecificProductScreen({required this.id,super.key});
  final int id;
  @override
  State<SpecificProductScreen> createState() => _SpecificProductScreenState();
}

class _SpecificProductScreenState extends State<SpecificProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ProductListViewModel>(
        create: (BuildContext context) => ProductListViewModel()..fetchSpecificProduct(widget.id),
        child: Consumer<ProductListViewModel>(
          builder: (context,value,child){
            switch(value.specificProduct.status){
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 200,),
                    Icon(Icons.cloud_off,size: 100,),
                    Center(
                      child: Text(
                        "${value.specificProduct.message.toString()}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              case Status.complete:
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: kTextTabBarHeight,),
                      Center(
                        child: Utils.cachedImageNetwork(value.specificProduct.data!.image.toString(), 300, 300),
                      ),
                      SizedBox(height: kTextTabBarHeight,),
                      Text(value.specificProduct.data!.title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(value.specificProduct.data!.category.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(value.specificProduct.data!.description.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                      Row(
                        spacing: 5,
                        children: [
                          Icon(CupertinoIcons.star_fill,color: Colors.orangeAccent,size: 20,),
                          Text(value.specificProduct.data!.rating!.rate.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Price: \$${value.specificProduct.data!.price.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          IconButton(
                            onPressed: (){

                            },
                            icon: Icon(CupertinoIcons.heart),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
