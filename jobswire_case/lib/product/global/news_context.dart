import 'package:jobswire_case/collectapi_resource/model/news_model.dart';

class NewsContext{
  NewsModel? model;

  void saveModel(NewsModel? model){
    this.model = model;
  }
}