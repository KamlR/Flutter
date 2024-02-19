import 'package:flutter/material.dart';
import 'package:test_project/news/models/news.dart';

import '../widgets/piece_of_news_long.dart';
import '../widgets/piece_of_news_short.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('News Details'),
      ),
      body: SingleChildScrollView(
  child: Column(
    //crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ClipOval(
          child: news.urlToImage.isNotEmpty
            ? Image.network(
                news.urlToImage,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/help_image.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
        ),
      const SizedBox(height: 20), 
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
        news.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      ),
    
      const SizedBox(height: 50), 
      NewsDetailsShort(
        labelText: 'Author',
        valueText: news.author,
      ),
      NewsDetailsShort(
        labelText: 'Publication date',
        valueText: news.publishedAt,
      ),
      NewsDetailsShort(
        labelText: 'URL',
        valueText: news.url,
      ),
      const SizedBox(height: 50),
      NewsDetailsLong(
        labelText: 'Description',
        valueText: news.description,
      ),
      const SizedBox(height: 20),
      NewsDetailsLong(
        labelText: 'Content',
        valueText: news.content, 
      ),
    ],
  ),
),
    );
  }
}
