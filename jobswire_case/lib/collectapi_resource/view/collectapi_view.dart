import 'package:flutter/material.dart';
import 'package:jobswire_case/view_model/collectapi_view_model.dart';

class CollectApiView extends StatefulWidget {
  const CollectApiView({Key? key}) : super(key: key);

  @override
  State<CollectApiView> createState() => _CollectApiViewState();
}

class _CollectApiViewState extends CollectApiViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: isLoading ? CircularProgressIndicator() : null),
      body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (BuildContext context,int index){
            return Text(news[index].name ?? '');
          }),
    );
  }
}
