import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';
@JsonSerializable()
class News{
  final String title;
  final String author; 
  final String publishedAt;
  final String url;
  final String description;
  final String content;
  final String urlToImage;
  const News({
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.url,
    required this.description,
    required this.content,
    required this.urlToImage
  });
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

