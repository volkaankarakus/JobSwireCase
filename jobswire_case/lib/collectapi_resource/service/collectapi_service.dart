import 'dart:io';
import 'package:dio/dio.dart';
import '../model/news_model.dart';

abstract class ICollectApiService{
  final Dio dio;
  ICollectApiService(this.dio);

  Future<NewsModel?> getNewsModelItem();
}

class CollectApiService extends ICollectApiService{
  CollectApiService(Dio dio) : super(dio);

  @override
  Future<NewsModel?> getNewsModelItem() async {
    final response = await dio.get('/getNews?country=tr&tag=general');
    if(response.statusCode == HttpStatus.ok){
      final jsonBody = response.data;
      if(jsonBody is Map<String,dynamic>) {
        return NewsModel.fromJson(jsonBody);
      }
    }
    return null ;
  }
}

