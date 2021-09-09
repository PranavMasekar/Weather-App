import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {
  final String url;
  RecipeView(this.url);
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late String finalurl;
  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.url.toString().contains("http://")) {
      finalurl = widget.url.toString().replaceAll("http://", "https://");
    } else {
      finalurl = widget.url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Food Recipe App"),
        ),
        body: Container(
          child: WebView(
            initialUrl: finalurl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              setState(() {
                controller.complete(webViewController);
              });
            },
          ),
        ));
  }
}
