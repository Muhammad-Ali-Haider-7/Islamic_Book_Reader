import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/presentation/widgets/bookCard.dart';
import 'package:islamic_book_reader/essentials/router/app_routes.dart';

class HorizontalScrollingBooks extends StatelessWidget {
  final List<BooksEntity> bookData; // Assuming this is a list of data for each book
  final PageController pageController = PageController(viewportFraction: 0.6);

  HorizontalScrollingBooks({Key? key, required this.bookData}) : super(key: key);

  BooksEntity AddMore = BooksEntity(name: "Add More", id: "-1");

  List<BooksEntity> getBookData() {
    List<BooksEntity> books = [];
    books.addAll(bookData);
    books.add(AddMore);
    return books;
  }


  @override
  Widget build(BuildContext context) {
    // bookData.add(AddMore);
    
    final Books = getBookData();
    // print(Books);
    return Container(
      // height: 200, // Adjust based on your BookCard height
      child: PageView.builder(
        controller: pageController,
        itemCount: Books.length,
        itemBuilder: (context, index) {
          return Center(
            child: AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                double value = 1.0;
                if (pageController.position.haveDimensions) {
                  value = pageController.page! - index;
                  value = (1 - (value.abs() * .25)).clamp(0.75, 1.0);
                }
                if(Books.length-1 == index){
                  return Transform.scale(
                  scale: value,
                  child: BookCard(
                    text: "Add More",
                    path: "assets/Add.png",
                    callback: () {
                      context.goNamed(
                        AppRoutes.addMore.name,
                      );
                      // Your callback function here
                    },
                  ),
                );
                }
                return Transform.scale(
                  scale: value,
                  child: BookCard(
                    text: Books[index].name,
                    path: "assets/bookCover.jpeg",
                    callback: () {
                      // print(Books[index]);
                      // Your callback function here
                      context.goNamed(
                        AppRoutes.reading.name,
                        queryParameters: {
                          "BookId": Books[index].id,
                          "BookName": Books[index].name
                        }
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}