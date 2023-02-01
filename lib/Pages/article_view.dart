import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        

        iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,      

        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "App",
              style: TextStyle(color: Colors.blue),
            )
          ],
          
        ),
        
        
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          child: WebView(
        initialUrl: widget.blogUrl,
        onWebViewCreated: ((WebViewController webViewcont) {
          _completer.complete(webViewcont);
        }),
      )),
    );
  }
}
