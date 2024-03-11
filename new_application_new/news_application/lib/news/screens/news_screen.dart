import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/news/models/news.dart';
import 'package:test_project/news/server/news_getter.dart';
import 'package:test_project/providers/like_provider.dart';

import '../widgets/piece_of_news_long.dart';
import '../widgets/piece_of_news_short.dart';


class NewsScreen extends StatelessWidget {
  final VoidCallback loadDataFromServer;
  final News news;
  const NewsScreen({required this.loadDataFromServer, required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    //final news = ModalRoute.of(context)!.settings.arguments as News;
    return ProviderScope(
      child: _NewsScreen(news: news, loadDataFromServer: loadDataFromServer),
    );
  }
}

class _NewsScreen extends ConsumerWidget {
  final News news;
  final VoidCallback loadDataFromServer;

  const _NewsScreen({required this.loadDataFromServer, required this.news});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isLiked = ref.watch(isLikedProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('News Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
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
                      Positioned(
                        top: 0,
                        right: 12,
                        child: GestureDetector(
                          onTap: () async {
                            news.liked = !isLiked; 
                            ref.read(isLikedProvider.notifier).state = !isLiked;
                            await likeClick(context, isLiked, news.id);
                            loadDataFromServer();
                          },
                          child: isLiked
                              ? Image.asset(
                                  'assets/images/like.png',
                                  key: const Key('like_image'),
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/unlike.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  Future<void> likeClick(BuildContext context, bool isLiked, int newsId) async {
    if (isLiked) {
      await AllNewsGet().sendUnlikeInfo(newsId);
    } else {
      await AllNewsGet().sendLikeInfo(newsId);
    }  
  }
  
}
