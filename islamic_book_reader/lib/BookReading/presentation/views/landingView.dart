// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:go_router/go_router.dart';
// import 'package:islamic_book_reader/BookReading/presentation/bloc/bloc_BookReading.dart';
// import 'package:islamic_book_reader/BookReading/presentation/views/viewScroll.dart';
// import 'package:islamic_book_reader/essentials/router/app_routes.dart';
// import 'package:lottie/lottie.dart';




// class LandingView extends StatefulWidget{

//   @override
//   State<LandingView> createState() => _LandingViewState();
// }

// class _LandingViewState extends State<LandingView>{

//   @override
//   Widget build(BuildContext context) {
//     context.read<ReadingBloc>().add(ReadBooksFromLocalResourceEvent()); 
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
      
//         backgroundColor: Theme.of(context).colorScheme.primary,
        
//         title: const Text("تسنیم القرآن", style: TextStyle(color: Colors.white , fontFamily: 'AlviNastaleeq'),),
//         actions: [
//           IconButton(onPressed: (){
//             context.goNamed(AppRoutes.setting.name);
//           },
//            icon: const Icon(Icons.settings,color:  Colors.white))
//         ],
//       ),
//       body: BlocConsumer<ReadingBloc,ReadingBlocState>(
//         listener: (BuildContext context, ReadingBlocState state) {  
//             if(state is ReadingBlocError){
//               Fluttertoast.showToast(
//                 msg: state.msg,
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0
//               );
//             }
//         },
//         builder: (context, state){
//           if(state is ReadingBlocLoading){
//             return const Center(child: CircularProgressIndicator());
//           }
//           else if(state is ReadingBooksListBlocSuccess){
//             print(state.book);
//           return Column(
//           children: [
//             // Lottie Animation
//             Container(
//               height: height * 0.25, // Set the height as needed
//               child: Lottie.asset('assets/animations/bismilllah.json'), // Ensure the Lottie file is in the specified path
//             ),
//             // Horizontal Scrolling Books
//             Expanded(
//               child: 
//               HorizontalScrollingBooks(
//                 bookData: state.book,
//               ),
//             ),
//           ],
//           );
//           }
//           else{
//             return const Center(child: Text("Please Try Again"),);
//           }
//         }
//         ,
//       )
//     );
       
//   }

// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_book_reader/BookReading/presentation/bloc/bloc_BookReading.dart';
import 'package:islamic_book_reader/BookReading/presentation/views/viewScroll.dart';
import 'package:islamic_book_reader/essentials/router/app_routes.dart';
import 'package:lottie/lottie.dart';

class LandingView extends StatefulWidget {
  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    context.read<ReadingBloc>().add(ReadBooksFromLocalResourceEvent());
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: _isSearching
            ? Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'کتاب تلاش کریں...',
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(fontFamily: 'AlviNastaleeq'),
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(vertical : 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (query) {
                    context.read<ReadingBloc>().add(FilterBooksEvent( searchQuery: query));
                  },
                ),
            )
            : const Text(
                "تسنیم القرآن",
                style: TextStyle(color: Colors.white, fontFamily: 'AlviNastaleeq'),
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchController.clear();
                  context.read<ReadingBloc>().add(ReadBooksFromLocalResourceEvent());
                }
                _isSearching = !_isSearching;
              });
            },
          ),
          IconButton(
            onPressed: () {
              context.goNamed(AppRoutes.setting.name);
            },
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: BlocConsumer<ReadingBloc, ReadingBlocState>(
        listener: (BuildContext context, ReadingBlocState state) {
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
          } else if (state is ReadingBooksListBlocSuccess) {
            final filteredBooks = state.book.where((element) => element.name.contains(_searchController.text)).toList();
            return Column(
              children: [
                // Lottie Animation
                Container(
                  height: height * 0.25, // Set the height as needed
                  child: Lottie.asset('assets/animations/bismilllah.json'), // Ensure the Lottie file is in the specified path
                ),
                // Horizontal Scrolling Books
                Expanded(
                  child: HorizontalScrollingBooks(
                    bookData: filteredBooks,
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Please Try Again"),
            );
          }
        },
      ),
    );
  }
}
