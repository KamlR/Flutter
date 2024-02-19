// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      title: json['title'] as String? ?? "Заголовок не задан",
      author: json['author'] as String? ?? "Автор не задан",
      publishedAt: json['publishedAt'] as String? ?? "Дата публикации не задана",
      url: json['url'] as String? ?? "Ссылка на ресурс не задана",
      description: json['description'] as String? ?? "Описание не задано",
      content: json['content'] as String? ?? "Контент не задан",
      urlToImage: json['urlToImage'] as String? ?? "",
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'publishedAt': instance.publishedAt,
      'url': instance.url,
      'description': instance.description,
      'content': instance.content,
      'urlToImage': instance.urlToImage,
    };
