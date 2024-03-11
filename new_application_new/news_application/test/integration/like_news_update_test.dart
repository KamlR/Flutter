import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test_project/news/models/news.dart';
import 'package:test_project/news/screens/all_news_screen.dart';
import 'package:test_project/news/screens/news_screen.dart';


void main(){
  late Dio dio;
    late DioAdapter dioAdapter;
    const baseUrl = 'http://10.0.2.2:3001/api/news';
    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(dio: dio);
    });
  testWidgets('Removing like updates the favorite news list', (WidgetTester tester) async { 

      dioAdapter.onPost(
        '/liked',
        (server) => server.reply(201, null),
        data: {'id': 1, 'title': 'Test News', 'author': 'Author Name', 'publishedAt': '2024-03-11T10:00:00Z',
        'url': 'https://example.com/test_news', 'description': 'Description of the test news', 
        'content': 'Content of the test news', 'urlToImage': 'https://example.com/test_news_image.jpg', 
        'liked': true},
      );
      await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Виджет NewsScreen без избранных новостей
            NewsScreen(
              news: News(id: 1, title: 'Test News', author: 'Author Name', publishedAt: '2024-03-11T10:00:00Z',
        url: 'https://example.com/test_news', description: 'Description of the test news', 
        content: 'Content of the test news', urlToImage: 'https://example.com/test_news_image.jpg', 
        liked: true),
              loadDataFromServer: () {}, 
            ),

            AllNewsScreen(screenType: 2), // В этом тесте мы не передаем мок Dio в AllNewsScreen
          ],
        ),
      ),
    ));


    expect(find.byType(ListTile), findsOneWidget);


    expect(find.byType(ListTile), findsNothing);
    });
}