// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:islamic_book_reader/BookReading/presentation/bloc/bloc_BookReading.dart';
// import 'package:islamic_book_reader/essentials/fontSizeManager/fontSizeManager.dart';

// class ReadingView extends StatelessWidget {
//   const ReadingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Reading Page"),
//         ),
//         body: BlocConsumer<ReadingBloc, ReadingBlocState>(
//           listener: (context, state) {
//             if (state is ReadingBlocError) {
//               Fluttertoast.showToast(
//                   msg: state.msg,
//                   toastLength: Toast.LENGTH_SHORT,
//                   gravity: ToastGravity.BOTTOM,
//                   timeInSecForIosWeb: 1,
//                   backgroundColor: Colors.red,
//                   textColor: Colors.white,
//                   fontSize: 16.0);
//             }
//           },
//           builder: (context, state) {
//             if (state is ReadingBlocLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is ReadingBlocSuccess) {
//               return ListView.builder(
//                 itemCount: state.book.combinedEntityHeading.length,
//                 itemBuilder: (context, headingIndex) {
//                   final heading =
//                       state.book.combinedEntityHeading[headingIndex];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           heading.heading.heading,
//                           style: TextStyle(
//                               fontSize: FontSizeManager.heading.toDouble(), fontWeight: FontWeight.bold),
//                         ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: heading.combinedEntityContent.length,
//                           itemBuilder: (context, contentIndex) {
//                             final content =
//                                 heading.combinedEntityContent[contentIndex];
//                             return Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     content.content.content,
//                                     style: TextStyle(color: Colors.black , fontSize: FontSizeManager.content.toDouble()),
//                                   ),
//                                   ListView.builder(
//                                     shrinkWrap: true,
//                                     physics: NeverScrollableScrollPhysics(),
//                                     itemCount: content.arabic.length,
//                                     itemBuilder: (context, arabicIndex) {
//                                       final arabic =
//                                           content.arabic[arabicIndex];
//                                       return Text(
//                                         arabic.arabic,
//                                         style: TextStyle(color: Colors.red, fontSize: FontSizeManager.arabic.toDouble()),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }

//             return Center(child: Text("Please Try Again"));
//           },
//         ));
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:islamic_book_reader/BookReading/presentation/bloc/bloc_BookReading.dart';
import 'package:islamic_book_reader/essentials/fontSizeManager/fontSizeManager.dart';

class ReadingView extends StatefulWidget {
  const ReadingView({super.key});

  @override
  _ReadingViewState createState() => _ReadingViewState();
}

class _ReadingViewState extends State<ReadingView> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
         iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("پڑھنے کا صفحہ", style: TextStyle(color: Colors.white,fontFamily: 'AlviNastaleeq'),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
              
                controller: _searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "تلاش کریں...",
                  hintStyle: const TextStyle(fontFamily: 'AlviNastaleeq'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.search,),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
              ),
            ),
          ),
        ),
      ),
      body: BlocConsumer<ReadingBloc, ReadingBlocState>(
        listener: (context, state) {
          if (state is ReadingBlocError) {
            Fluttertoast.showToast(
              msg: state.msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          if (state is ReadingBlocLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReadingBlocSuccess) {
            final filteredHeadings = state.book.combinedEntityHeading.where((heading) {
              return heading.heading.heading.contains(_searchQuery) ||
                     heading.combinedEntityContent.any((content) =>
                       content.content.content.contains(_searchQuery) ||
                       content.arabic.any((arabic) =>
                         arabic.arabic.contains(_searchQuery)
                       )
                     );
            }).toList();


            return Center(
              child: ListView.builder(
                itemCount: filteredHeadings.length,
                itemBuilder: (context, headingIndex) {
                  final heading = filteredHeadings[headingIndex];
                  return ExpansionTile(
                    title: Text(
                          heading.heading.heading,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: FontSizeManager.heading.toDouble(),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AlviNastaleeq'
                          )),
          
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: heading.combinedEntityContent.length,
                          itemBuilder: (context, contentIndex) {
                            final content = heading.combinedEntityContent[contentIndex];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    content.content.content,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: FontSizeManager.content.toDouble(),
                                      fontFamily: 'AlviNastaleeq'
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: content.arabic.length,
                                    itemBuilder: (context, arabicIndex) {
                                      final arabic = content.arabic[arabicIndex];
                                      return Text(
                                        arabic.arabic,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: FontSizeManager.arabic.toDouble(),
                                          fontFamily: 'MuhammadiQuranic'
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                    ],
                  );
          })
              );
                

             // return Center(
            //   child: ListView.builder(
            //     itemCount: filteredHeadings.length,
            //     itemBuilder: (context, headingIndex) {
            //       final heading = filteredHeadings[headingIndex];
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Text(
            //               heading.heading.heading,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: FontSizeManager.heading.toDouble(),
            //                 fontWeight: FontWeight.bold,
            //                 fontFamily: 'AlviNastaleeq'
            //               ),
            //             ),
            //             ListView.builder(
            //               shrinkWrap: true,
            //               physics: NeverScrollableScrollPhysics(),
            //               itemCount: heading.combinedEntityContent.length,
            //               itemBuilder: (context, contentIndex) {
            //                 final content = heading.combinedEntityContent[contentIndex];
            //                 return Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         content.content.content,
            //                         textAlign: TextAlign.right,
            //                         style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: FontSizeManager.content.toDouble(),
            //                           fontFamily: 'AlviNastaleeq'
            //                         ),
            //                       ),
            //                       ListView.builder(
            //                         shrinkWrap: true,
            //                         physics: NeverScrollableScrollPhysics(),
            //                         itemCount: content.arabic.length,
            //                         itemBuilder: (context, arabicIndex) {
            //                           final arabic = content.arabic[arabicIndex];
            //                           return Text(
            //                             arabic.arabic,
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                               color: Colors.red,
            //                               fontSize: FontSizeManager.arabic.toDouble(),
            //                               fontFamily: 'MuhammadiQuranic'
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                     ],
            //                   ),
            //                 );
            //               },
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // );
          }

          return Center(child: Text("Please Try Again"));
        },
      ),
    );
  }
}

