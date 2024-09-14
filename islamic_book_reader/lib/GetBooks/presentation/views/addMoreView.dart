import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_book_reader/BookReading/presentation/pages/landingPage.dart';
import 'package:islamic_book_reader/GetBooks/presentation/bloc/downloadBook_bloc.dart';
import 'package:islamic_book_reader/GetBooks/presentation/widgets/downloadBookTile.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';
import 'package:islamic_book_reader/essentials/router/app_routes.dart';

class AddMoreView extends StatefulWidget {
  const AddMoreView({Key? key}) : super(key: key);

  @override
  _AddMoreViewState createState() => _AddMoreViewState();
}

class _AddMoreViewState extends State<AddMoreView> {

  void navigateToInitialRoute(BuildContext context) {
  context.go("/");
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("مزید کتب شامل کریں", style: TextStyle(color: Colors.white, fontFamily: 'AlviNastaleeq')),
      actions: [
        IconButton(
          onPressed: (){
            DatabaseHelper.deleteDatabaseFile();
          },
          icon: const Icon(Icons.delete),
        )
      
      ],),
      body: BlocConsumer<DownloadbookBloc,DownloadbookState>(
        listener: (BuildContext context, DownloadbookState state) { 
          if(state is DownloadbookSuccess){
            Fluttertoast.showToast(
                msg: "Book Downloaded",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                textColor: Colors.black,
                fontSize: 16.0
              );
              // context.goNamed(AppRoutes.landing.name);

              navigateToInitialRoute(context);
            
          }
          else if(state is DownloadbookError){
            Fluttertoast.showToast(
                msg: state.msg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color.fromARGB(255, 255, 131, 131),
                textColor: Colors.black,
                fontSize: 16.0
              );
          }
         },
        builder: (context, state){
          if(state is DownloadbookInitial){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is DownloadbookLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is DownloadViewBooksListBlocSuccess){
            return ListView.builder(
              itemCount: state.book.length,
              itemBuilder: (context, index) {
                return DownloadBookTile(
                  bookName: state.book[index].name,
                  onTap: (){
                    context.read<DownloadbookBloc>().add(DownloadBookFromRemoteResourceEvent(bookName: state.book[index].name,bookId: state.book[index].id));
                  },
                );
              },
            );
          }
          else {
            return const Center(child: Text("there are no book on the remote server"));
          }
        },)
    );
  }
}