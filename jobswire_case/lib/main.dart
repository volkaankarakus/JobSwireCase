import 'package:flutter/material.dart';
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
      home: CollectApiView(),
    );
  }
}