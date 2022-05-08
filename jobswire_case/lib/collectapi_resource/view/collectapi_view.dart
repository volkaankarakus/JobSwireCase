import 'package:flutter/material.dart';
import 'package:jobswire_case/collectapi_resource/model/news_model.dart';
import 'package:jobswire_case/collectapi_resource/service/collectapi_service.dart';
import 'package:jobswire_case/product/global/theme_notifier.dart';
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
          appBar: AppBar(
            title: context.watch<CollectApiProvider>().isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : null,
            actions: [
              appBarIconButton(context)
            ],),
          body: Padding(
            padding: PaddingUtility().paddingSymmetric,
            child: Column(
                children : [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: _newsListView(context,context.watch<CollectApiProvider>().news))
                ],
            ),
          ),

        );
      });
  }

  IconButton appBarIconButton(BuildContext context) {
    return IconButton(
                onPressed: (){
                  context.read<ThemeNotifier>().changeTheme();
                },
                icon: context.read<ThemeNotifier>().isLightTheme ?  Icon(Icons.dark_mode) : Icon(Icons.light_mode));
  }

  ListView _newsListView(BuildContext context, List<Result> items) {
    return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context,int index) {
              return Card(
                margin: PaddingUtility().paddingBottom,
                child: SizedBox(
                  height: 300,
                  child: Padding(
                    padding: PaddingUtility().paddingAllCard,
                    child: Column(
                        children : [
                          Expanded(
                              child: Image.network(items[index].image ?? '',fit: BoxFit.cover, )
                          ),
                          Padding(
                            padding: PaddingUtility().paddingTop,
                            child: Column(
                                crossAxisAlignment : CrossAxisAlignment.center,
                                children : [
                                  Text(items[index].name ?? '')]),
                          ),
                        ]
                    ),
                  ),
                ),
              );
            });
  }
}

class PaddingUtility{
  final paddingTop = EdgeInsets.only(top: 10);
  final paddingSymmetric = EdgeInsets.symmetric(horizontal: 15);
  final paddingAllCard = EdgeInsets.all(8.0);
  final paddingBottom = EdgeInsets.only(bottom: 30);
}
