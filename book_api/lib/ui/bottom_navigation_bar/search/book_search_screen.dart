import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_setup/config/widget/textfield/app_textformfield.dart';
import 'package:get/get.dart';
import '../../../config/color/app_colors.dart';
import '../../../data/response/status.dart';
import '../../../utils/utils.dart';
import '../../../view_model/bank/bank_view_model.dart';
import '../book_list/specific_book_screen.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen>
    with SingleTickerProviderStateMixin {
  final bookController = Get.put(BankViewModel());
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  String _searchQuery = "";

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // Filtered book list based on search query
    final filteredBooks = bookController.bookList.value.items?.where((book) {
      final title = book.volumeInfo?.title?.toLowerCase() ?? "";
      return title.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Book"),
      ),
      body: Obx(() {
        switch (bookController.rxRequestStatus.value) {
          case Status.loading:
            return Center(child: Utils.dualRing);
          case Status.error:
            return Center(child: Text(bookController.error.toString()));
          case Status.complete:
          // Start animation
            _animationController.forward();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: AppTextFormField(
                    hintText: "Search Book",
                    prefixIcon: const Icon(CupertinoIcons.search),
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value; // Update the search query
                      });
                    },
                  ),
                ),
                Expanded(
                  child: filteredBooks == null || filteredBooks.isEmpty
                      ? const Center(child: Text("No books found"))
                      : MasonryGridView.builder(
                    itemCount: filteredBooks.length,
                    gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    itemBuilder: (context, index) {
                      var volumeInfo = filteredBooks[index].volumeInfo;
                      var bookId = filteredBooks[index].id;

                      // AnimatedBuilder for each grid item
                      return AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _animation,
                            child: Transform.translate(
                              offset: Offset(
                                  0.0, 50 * (1 - _animation.value)),
                              child: child,
                            ),
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SpecificBookScreen(
                                    bookId: bookId.toString()),
                              ),
                            );
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
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: CachedNetworkImage(
                                    imageUrl: volumeInfo?.imageLinks?.thumbnail.toString() ?? "",
                                    height: 250,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Utils.dualRing,
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  volumeInfo?.title.toString() ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Publisher: ${volumeInfo?.publisher?.toString() ?? ""}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Publisher Date: ${volumeInfo?.publishedDate?.toString() ?? ""}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Pages: ${volumeInfo!.pageCount?.toString() ?? "N/A"}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
        }
      }),
    );
  }
}
