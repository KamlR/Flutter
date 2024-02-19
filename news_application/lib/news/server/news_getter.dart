import 'package:dio/dio.dart';
import 'package:test_project/news/models/news.dart';

class AllNewsGet{
  Future <List<News>> getAllNewsFromServer() async{
    final response = await Dio().get("https://newsapi.org/v2/everything?q=apple&from=2024-02-14&to=2024-02-14&sortBy=popularity&apiKey=2702c0cdc3d74f15a4aca600b827bcde");
    final List<dynamic> jsonResponse = response.data['articles'];
    List<News> newsList = jsonResponse.map((json) => News.fromJson(json)).toList();
    return newsList;
  }
}