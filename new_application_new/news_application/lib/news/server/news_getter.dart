import 'package:dio/dio.dart';
import 'package:test_project/news/models/news.dart';

class AllNewsGet{
  Future <List<News>> getAllNewsFromServer(int urlType) async{
    String url = "";
    if (urlType == 1){
      url = "http://10.0.2.2:3001/api/news/getall";
    }
    else if(urlType == 2){
      url = "http://10.0.2.2:3001/api/news/liked";
    }
    final response = await Dio().get(url);
    final List<dynamic> jsonResponse = response.data;
    List<News> newsList = jsonResponse.map((json) => News.fromJson(json)).toList();
    return newsList;
  }

  Future<void> sendLikeInfo(int newsID) async{
    await Dio().post("http://10.0.2.2:3001/api/news/like/$newsID");
  }
  Future<int?> sendUnlikeInfo(int newsID) async{
    final response = await Dio().post("http://10.0.2.2:3001/api/news/unlike/$newsID");
    return response.statusCode;
  }

}