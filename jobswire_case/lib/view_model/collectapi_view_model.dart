import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobswire_case/collectapi_resource/model/news_model.dart';
import 'package:jobswire_case/collectapi_resource/service/collectapi_service.dart';
import 'package:jobswire_case/product/service/project_network_manager.dart';
import '../collectapi_resource/view/collectapi_view.dart';

abstract class CollectApiViewModel extends LoadingStateful<CollectApiView> with ProjectDioMixin{
  late final ICollectApiService collectApiService;
  List<Result> news = [];

  @override
  void initState() {
    super.initState();
    collectApiService = CollectApiService(service);
    _getData();
  }

  Future<void> _getData() async{
    changeLoading();
    news = (await collectApiService.getNewsModelItem())?.result ?? [];
    changeLoading();
  }
}

abstract class LoadingStateful<T extends StatefulWidget> extends State<T>{
  bool isLoading = false;
  void changeLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }
}
