import 'package:riverpod/riverpod.dart';

import '../news/models/news.dart';

class NewsState {
  static News? currentNews;
  static int status = 0;
}

final isLikedProvider = StateProvider<bool>((ref) {
  if (NewsState.currentNews != null) {  
    if(NewsState.status!=0){
      NewsState.currentNews!.liked = !NewsState.currentNews!.liked;
    }
    NewsState.status = 1;
    return NewsState.currentNews!.liked;
  } else {
    // Значение по умолчанию, если текущий News не установлен
    return false;
  }
});
