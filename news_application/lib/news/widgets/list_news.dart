import 'package:flutter/material.dart';
import 'package:test_project/news/models/news.dart';

Widget newsListViewSeparated(List<News> allNews, BuildContext context) {
  return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
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
            Navigator.of(context).pushNamed(
              '/news',
              arguments: allNews[i],
            );
          },
        ),
      );
}
