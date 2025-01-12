import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../utils/utils.dart';
import '../../../view_model/bank/bank_view_model.dart';

class SpecificBookScreen extends StatefulWidget {
  const SpecificBookScreen({required this.bookId,super.key});
  final String bookId;

  @override
  State<SpecificBookScreen> createState() => _SpecificBookScreenState();
}

class _SpecificBookScreenState extends State<SpecificBookScreen> {
  final BankViewModel bookController = Get.find<BankViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookController.specificBookApi(widget.bookId);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx((){
        switch(bookController.rxRequestStatus.value){
          case Status.loading:
            return Center(child: Utils.dualRing);
          case Status.error:
            print(bookController.error.toString());
            return Center(child: Text(bookController.error.toString()));
          case Status.complete:
            var data = bookController.specificBook.value.volumeInfo;
            final authors = List.generate(
              data!.authors!.length,
                  (index) => data.authors![index],
            ).join(", ");
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CachedNetworkImage(
                        imageUrl: bookController.specificBook.value.volumeInfo?.imageLinks?.thumbnail.toString() ?? "",
                        height: 400,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Utils.dualRing,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    ListTile(
                      title: Text("Book Name"),
                      subtitle: Text(data.title.toString() ?? "",style: Theme.of(context).textTheme.titleMedium,),
                    ),
                    ListTile(
                      title: Text("Number of Pages"),
                      subtitle: Text(data.pageCount.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      title: Text("Version"),
                      subtitle: Text(data.contentVersion.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      title: Text("Type"),
                      subtitle: Text(data.printType.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      title: Text("Author"),
                      subtitle: Text(authors,style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      title: Text("Publisher"),
                      subtitle: Text(data.publisher.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      title: Text("Published Date"),
                      subtitle: Text(data.publishedDate.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      trailing: Icon(CupertinoIcons.star_fill,color: Colors.orangeAccent,),
                      title: Text("Book Rating"),
                      subtitle: Text(data.ratingsCount.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      title: Text("Language"),
                      subtitle: Text(data.language == "en" ? "English" : data.language.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                    ListTile(
                      title: Text("Description:"),
                      subtitle: Text(data.description.toString() ?? "",style: Theme.of(context).textTheme.labelSmall,),
                    ),
                  ],
                ),
              ),
            );
        }
      }),
    );
  }
}
