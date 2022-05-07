import 'package:flutter/material.dart';
import 'package:jobswire_case/collectapi_resource/model/news_model.dart';
import 'package:jobswire_case/collectapi_resource/service/collectapi_service.dart';
import 'package:jobswire_case/product/service/project_network_manager.dart';
import 'package:jobswire_case/view_model/collectapi_provider_model.dart';
import 'package:jobswire_case/view_model/collectapi_view_model.dart';
import 'package:provider/provider.dart';

class CollectApiView extends StatefulWidget {
  const CollectApiView({Key? key}) : super(key: key);

  @override
  State<CollectApiView> createState() => _CollectApiViewState();
}

//class _CollectApiViewState extends CollectApiViewModel {
class _CollectApiViewState extends State<CollectApiView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CollectApiProvider(CollectApiService(service)),
      builder: (context, child) {
        return Scaffold(
          // appBar: AppBar(title: isLoading ? CircularProgressIndicator() : null),
          //body: ListView.builder(
          //    itemCount: news.length,
          //    itemBuilder: (BuildContext context, int index) {
          //      inspect(news[index]);
          //      return Card(child: Text(news[index].name ?? ''));
          //    }),
          appBar: AppBar(
            title: context.watch<CollectApiProvider>().isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : null ),
          body: Column(
              children : [
                Selector<CollectApiProvider,bool>(builder: (context, value, child) {
                  return value ? Placeholder() :  Text('data');
                }, selector: (context, provider){
                  return provider.isLoading;
                }),
                Expanded(child: _newsListView(context,context.watch<CollectApiProvider>().news))
              ],
          ),

        );
      });
  }

  ListView _newsListView(BuildContext context, List<Result> items) {
    return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context,int index) {
              return Card(child: Text(items[index].name ?? ''));
            });
  }
}
