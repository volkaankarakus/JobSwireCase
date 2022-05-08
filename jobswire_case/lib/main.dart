import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobswire_case/collectapi_resource/view/collectapi_view.dart';
import 'package:jobswire_case/product/global/news_context.dart';
import 'package:jobswire_case/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => NewsContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
    ],
    builder: (context,child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,

      // ThemeData.dark().copyWith(
      //     tabBarTheme: TabBarTheme(
      //       labelColor: Colors.white,
      //       unselectedLabelColor: Colors.white,
      //       // indicatorSize: TabBarIndicatorSize.label,
      //     ),
      //
      //     bottomAppBarTheme: BottomAppBarTheme(
      //       shape: CircularNotchedRectangle(),
      //     ),
      //
      //     progressIndicatorTheme:
      //     ProgressIndicatorThemeData(color: Colors.white),
      //
      //     listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
      //
      //     inputDecorationTheme: InputDecorationTheme(
      //       filled: true,
      //       fillColor: Colors.white,
      //       iconColor: Colors.red,
      //       border: OutlineInputBorder(),
      //     ),
      //
      //     cardTheme: CardTheme(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20))
      //     ),
      //
      //     appBarTheme: AppBarTheme(
      //         centerTitle: true,
      //         systemOverlayStyle: SystemUiOverlayStyle.light,
      //         backgroundColor: Colors.transparent,
      //         elevation: 0)),

      home: CollectApiView(),
    );
  }
}