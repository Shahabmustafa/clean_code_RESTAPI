

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/config/color/app_colors.dart';
import 'package:flutter_setup/ui/bottom_navigation_bar/book_list/specific_book_screen.dart';
import 'package:flutter_setup/utils/utils.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../view_model/bank/bank_view_model.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {

  final bookController = Get.put(BankViewModel());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book List"),
        automaticallyImplyLeading: false,
      ),
      body: Obx((){
        switch(bookController.rxRequestStatus.value){
          case Status.loading:
            return Center(child: Utils.dualRing);
          case Status.error:
            print(bookController.error.toString());
            return Center(child: Text(bookController.error.toString()));
          case Status.complete:
            return GridView.builder(
              itemCount: bookController.bookList.value.items!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent: size.height * 0.43,
              ),
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                var volumeInfo = bookController.bookList.value.items![index].volumeInfo;
                var bookId = bookController.bookList.value.items![index].id;
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificBookScreen(bookId: bookId.toString())));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.grey.shade400,
                          blurRadius: 1,
                          offset: const Offset(0.2, 0.2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Center the image
                        CachedNetworkImage(
                          imageUrl: volumeInfo?.imageLinks?.thumbnail.toString() ?? "",
                          height: 250,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Utils.dualRing,
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        const SizedBox(height: 8), // Add spacing between image and text

                        // Title with overflow handling
                        Text(
                          volumeInfo?.title.toString() ?? "",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 16, // Reduce font size for better fit
                          ),
                          maxLines: 2, // Limit to 2 lines
                          overflow: TextOverflow.ellipsis, // Add ... when text overflows
                        ),
                        const SizedBox(height: 4),

                        // Publisher info with overflow handling
                        Text(
                          "Publisher: ${volumeInfo?.publisher?.toString() ?? ""}",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColor.grey,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Published date with overflow handling
                        Text(
                          "Publisher Date: ${volumeInfo?.publishedDate?.toString() ?? ""}",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColor.grey,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // Page count
                        Text(
                          "Pages: ${volumeInfo!.pageCount?.toString() ?? "N/A"}",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
