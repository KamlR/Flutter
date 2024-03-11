import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/news/models/news.dart';
import 'package:test_project/news/screens/news_screen.dart';
import 'package:test_project/news/widgets/piece_of_news_long.dart';
import 'package:test_project/news/widgets/piece_of_news_short.dart';

void main() {
  group("NewsScreen widgets testing", () { 
    testWidgets('NewsScreen contains all NewsDetailsLong widgets', (WidgetTester tester) async {
    // Создаем экземпляр News для передачи в NewsScreen
    final news = News(
      id: 1,
      title: 'Test Title',
      author: 'Test Author',
      publishedAt: '2022-03-09',
      url: 'https://example.com',
      description: 'Test Description',
      content: 'Test Content',
      urlToImage: "",
      liked: false
    );

    // Загружаем NewsScreen в тестовую среду
    await tester.pumpWidget(MaterialApp(home: NewsScreen(news: news, loadDataFromServer: () {  },)));
    // Проверяем, что каждый NewsDetailsLong виджет присутствует
    expect(find.byType(NewsDetailsLong), findsNWidgets(2)); // В данном случае у вас два экземпляра NewsDetailsLong в NewsScreen
  });

  testWidgets('NewsScreen contains all NewsDetailsShort widgets', (WidgetTester tester) async {
    // Создаем экземпляр News для передачи в NewsScreen
    final news = News(
      id: 1,
      title: 'Test Title',
      author: 'Test Author',
      publishedAt: '2022-03-09',
      url: 'https://example.com',
      description: 'Test Description',
      content: 'Test Content',
      urlToImage: "",
      liked: false
    );

    // Загружаем NewsScreen в тестовую среду
    await tester.pumpWidget(MaterialApp(home: NewsScreen(news: news, loadDataFromServer: () {  },)));
    // Проверяем, что каждый NewsDetailsLong виджет присутствует
    expect(find.byType(NewsDetailsShort), findsNWidgets(3)); // В данном случае у вас два экземпляра NewsDetailsLong в NewsScreen
  });
  });
  
}