import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_book_reader/BookReading/presentation/pages/landingPage.dart';
import 'package:islamic_book_reader/BookReading/presentation/pages/readingPage.dart';
import 'package:islamic_book_reader/Configrations/presentation/pages/settingPage.dart';
import 'package:islamic_book_reader/GetBooks/presentation/pages/addMore.dart';
import 'package:islamic_book_reader/essentials/router/app_routes.dart';



final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

class AppRouter{
  
  final GoRouter router;
  AppRouter()
  : router = GoRouter(
    initialLocation: routeMap[AppRoutes.landing], 
    debugLogDiagnostics: true,
    navigatorKey: rootKey,
    routes: [
      GoRoute(
        path:routeMap[AppRoutes.landing]!,
        name: AppRoutes.landing.name,
        builder: (context,state) => LandingPage(),
        routes: [
          GoRoute(
            path: routeMap[AppRoutes.addMore]!,
            name: AppRoutes.addMore.name,
            builder: (context,state) => AddMore(),
          ),
          GoRoute(
            path: routeMap[AppRoutes.reading]!,
            name: AppRoutes.reading.name,
            builder: (context,state){
              final id = state.uri.queryParameters['BookId']!;
              final name = state.uri.queryParameters['BookName']!;
              return ReadingPage(BookName: name, Bookid: id);
            },
            ),

          GoRoute(
            path: routeMap[AppRoutes.setting]!,
            name: AppRoutes.setting.name,
            builder: (context,state){
              return SettingPage();
            },
            )
        ]
        )
    ],

  );
}