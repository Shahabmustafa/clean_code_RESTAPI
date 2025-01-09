import 'package:ecommerce_api/config/color/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../utils/utils.dart';
import '../../view_model/category/category_view_model.dart';
import '../product/specific_product_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> category = ["electronics","jewelery","men's clothing","women's clothing"];
  String selectValue = "electronics";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: ChangeNotifierProvider<CategoryViewModel>(
        create: (BuildContext context) => CategoryViewModel()..fetchSpecificProduct(selectValue),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      selectValue = category[index];
                      setState(() {
                        print(selectValue);
                      });
                      Provider.of<CategoryViewModel>(context, listen: false).fetchSpecificProduct(selectValue);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: selectValue == category[index] ? AppColor.primaryColor : AppColor.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColor.primaryColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              category[index],
                              style: TextStyle(
                                color: selectValue == category[index] ? AppColor.white : AppColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Consumer<CategoryViewModel>(
              builder: (context,value,child){
                switch(value.category.status){
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
                            "${value.category.message.toString()}",
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
                    return Expanded(
                      child: ListView.builder(
                        itemCount: value.category.data!.length,
                        itemBuilder: (context, index) {
                          var product = value.category.data![index];
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
                                        color: AppColor.grey,
                                        blurRadius: 10,
                                        blurStyle: BlurStyle.inner,
                                        offset: Offset(0.2, 0.4),
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
                      ),
                    );
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
