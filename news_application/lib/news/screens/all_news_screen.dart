import 'package:flutter/material.dart';

import '../models/news.dart';
import '../server/news_getter.dart';
import '../widgets/list_news.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreen();
}

class _AllNewsScreen extends State<AllNewsScreen> {
  List<News>? allNews;
  @override
  void initState() {
    loadDataFromServer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: (allNews == null)
      ? const Center(child: CircularProgressIndicator())
      : newsListViewSeparated(allNews!, context)
        
    );
  }
  Future<void> loadDataFromServer() async{
    allNews = await AllNewsGet().getAllNewsFromServer();
    setState(() {});
  }
}