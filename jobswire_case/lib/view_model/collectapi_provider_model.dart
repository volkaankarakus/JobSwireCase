import 'package:flutter/cupertino.dart';
import 'package:jobswire_case/collectapi_resource/model/news_model.dart';
import 'package:jobswire_case/collectapi_resource/service/collectapi_service.dart';

class CollectApiProvider extends ChangeNotifier{
  final ICollectApiService collectApiService;
  CollectApiProvider(this.collectApiService) {
    _getData();
  }

  List<Result> news = [];

  bool isLoading = false;

  void _changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _getData() async{
    _changeLoading();
    news = (await collectApiService.getNewsModelItem())?.result ?? [];
    _changeLoading();
  }
}

