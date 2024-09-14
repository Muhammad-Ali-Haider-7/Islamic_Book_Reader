import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/remote_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/presentation/views/viewScroll.dart';
import 'package:islamic_book_reader/BookReading/presentation/widgets/bookCard.dart';
import 'package:islamic_book_reader/essentials/di.dart';
import 'package:islamic_book_reader/essentials/router/app_router.dart';
import 'package:islamic_book_reader/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SetUp();
  // runApp(MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  final AppRouter _appRouter = AppRouter();

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 33, 243, 107), secondary: const Color.fromARGB(255, 68, 255, 155)),
      ),
      locale: const Locale('ur', 'PK'), // Set the locale to Urdu
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ur', 'PK'), // Add the supported locale
      ],
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.router,
    );
  }
}

