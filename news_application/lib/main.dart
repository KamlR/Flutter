import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/theme/theme_provider.dart';
import 'news/screens/tab_bar_screen.dart';
import 'news/screens/news_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>ThemeProvider(), 
      child: const NewsApp(),
    )
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).getThemeData,
      routes: {
        '/':(context) => const TabBarScreen(),
        '/news': (context) =>const  NewsScreen()
      },
    );
  }
}






