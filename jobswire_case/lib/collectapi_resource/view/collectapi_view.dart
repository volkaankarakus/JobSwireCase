import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobswire_case/collectapi_resource/model/news_model.dart';
import 'package:jobswire_case/collectapi_resource/service/collectapi_service.dart';
import 'package:jobswire_case/collectapi_resource/view/collectapi_detail_view.dart';
import 'package:jobswire_case/product/constant/duration_items.dart';
import 'package:jobswire_case/product/constant/lottie_items.dart';
import 'package:jobswire_case/product/global/theme_notifier.dart';
import 'package:jobswire_case/product/service/project_network_manager.dart';
import 'package:jobswire_case/view_model/collectapi_provider_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CollectApiView extends StatefulWidget {
  const CollectApiView({Key? key}) : super(key: key);

  @override
  State<CollectApiView> createState() => _CollectApiViewState();
}

//class _CollectApiViewState extends CollectApiViewModel {
class _CollectApiViewState extends State<CollectApiView> with ProjectDioMixin,TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CollectApiProvider(CollectApiService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: _costumizedAppBar(context),
          body: context.watch<CollectApiProvider>().isLoading
            ? Center(child: Lottie.asset(LottieItems.loading.lottiePath))
          : Padding(
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

  AppBar _costumizedAppBar(BuildContext context) {
    return AppBar(
          centerTitle: true,
          title: context.watch<CollectApiProvider>().isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text('Jobswire',style: GoogleFonts.oleoScript().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            fontSize: 30
          )),
          actions: [
            lottieButton(context)
          ],);
  }

  InkWell lottieButton(BuildContext context) {
    return InkWell(
              onTap: (){
                controller.animateTo(context.read<ThemeNotifier>().isLightTheme ? 0.5 : 1);
                context.read<ThemeNotifier>().changeTheme();
              },
                child: Lottie.asset(
                    LottieItems.themeChange.lottiePath,
                    repeat: false,
                controller: controller));
  }


  ListView _newsListView(BuildContext context, List<Result> items) {
    return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context,int index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CollectApiDetailView(result: items[index],)));
                },
                child: Card(
                  elevation: 5,
                  margin: PaddingUtility().paddingBottom,
                  child: SizedBox(
                    height: 300,
                    child: Padding(
                      padding: PaddingUtility().paddingAllCard,
                      child: Column(
                          children : [
                            Expanded(
                                child: Hero(
                                  tag: items[index],
                                    child: Image.network(items[index].image ?? '',fit: BoxFit.cover, ))
                            ),
                            Padding(
                              padding: PaddingUtility().paddingTop,
                              child: Column(
                                  crossAxisAlignment : CrossAxisAlignment.center,
                                  children : [
                                    Text(
                                        items[index].name ?? '',
                                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                            fontWeight: FontWeight.w400),)]),
                            ),
                          ]
                      ),
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
