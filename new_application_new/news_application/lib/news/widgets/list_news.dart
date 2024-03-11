import 'package:flutter/material.dart';
import 'package:test_project/news/models/news.dart';
import 'package:test_project/news/screens/news_screen.dart';
import 'package:test_project/providers/like_provider.dart';

Widget newsListViewSeparated(List<News> allNews, BuildContext context, VoidCallback loadDataFromServer) {
  return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: allNews.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(
            allNews[i].title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            allNews[i].publishedAt,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          leading: ClipOval(
          child: allNews[i].urlToImage.isNotEmpty
            ? Image.network(
                allNews[i].urlToImage,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/help_image.jpg',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
        ),
          onTap: () {
            NewsState.currentNews = allNews[i];
            NewsState.status = 0;
            Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsScreen(news: allNews[i], loadDataFromServer: loadDataFromServer),
            ),
            );
          },
        ),
      );
}
