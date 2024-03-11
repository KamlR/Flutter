import 'package:flutter/material.dart';

import '../models/news.dart';
import '../server/news_getter.dart';
import '../widgets/list_news.dart';

class AllNewsScreen extends StatefulWidget {
  final int screenType;
  const AllNewsScreen({super.key, required this.screenType});
  @override
  State<AllNewsScreen> createState() => _AllNewsScreen();
}

class _AllNewsScreen extends State<AllNewsScreen> {
  static List<News>? allNews;
  @override
  void initState() {
    loadDataFromServer();
    super.initState();
  }
  @override
void didUpdateWidget(AllNewsScreen oldWidget) {
  super.didUpdateWidget(oldWidget);
  loadDataFromServer();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: (allNews == null)
      ? const Center(child: CircularProgressIndicator())
      : allNews!.isEmpty
        ? const Center(
            child: Text('Избранных новостей пока нет'),
          )
        : newsListViewSeparated(allNews!, context, loadDataFromServer)
        
    );
  }
  Future<void> loadDataFromServer() async{
    allNews = await AllNewsGet().getAllNewsFromServer(widget.screenType);
    setState(() {});
  }
}