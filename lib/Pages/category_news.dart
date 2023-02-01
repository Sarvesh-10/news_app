import 'dart:convert';
import 'package:flutter_application_1/NewsTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_application_1/Pages/article.dart';
import 'package:http/http.dart' as http;
import 'news.dart';

class CategeoryNews extends StatefulWidget {
  CategeoryNews({required this.category});
  final String category;

  @override
  State<CategeoryNews> createState() => _CategeoryNewsState();
}

class _CategeoryNewsState extends State<CategeoryNews> {
  bool loading = true;
  List<article> catNews = List.empty();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryyNews categoryyNews = CategoryyNews();
    await categoryyNews.getCatNews(widget.category.toLowerCase());
    catNews = categoryyNews.news;
    setState(() {
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
      body: loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : SingleChildScrollView(
            child: Container(
                child: Column(
                  children: [
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            ImageUrl: catNews[index].urlToImage,
                            heading: catNews[index].title,
                            content: catNews[index].content,
                            url: catNews[index].url,
                          );
                        },
                        itemCount: catNews.length,
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ],
                ),
              ),
          ),
    );
  }
}
