import 'package:flutter/material.dart';
import 'package:jobswire_case/collectapi_resource/model/news_model.dart';
import 'package:jobswire_case/collectapi_resource/view/collectapi_view.dart';
import 'package:jobswire_case/product/global/news_context.dart';
import 'package:provider/provider.dart';

class CollectApiDetailView extends StatefulWidget {
  Result result;

  CollectApiDetailView({required this.result});

  @override
  State<CollectApiDetailView> createState() => _CollectApiDetailViewState();
}

class _CollectApiDetailViewState extends State<CollectApiDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.result.source!,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
        body: Center(
            child: Column(children: [
          SizedBox(
            height: 700,
            child: Padding(
              padding: PaddingUtility().paddingAllCard,
              child: Column(children: [
                Expanded(
                    child: Image.network(
                  widget.result.image ?? '',
                  fit: BoxFit.cover,
                )),
                Padding(
                  padding: PaddingUtility().paddingTop,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.result.description ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
              ]),
            ),
          )
        ])));
  }
}
