import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/article.dart';
import 'package:flutter_application_1/Pages/article_view.dart';
import 'package:flutter_application_1/Pages/category_news.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/data.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/NewsTile.dart';

import 'news.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<article> articles = new List.empty();
  List<article> categoryNews = new List.empty();
  bool isLoading = true;
  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.list;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(children: [
                Container(
                  height: 70,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return CategoryTile(
                          ImageUrl: categories.elementAt(index).imageUrl,
                          category: categories.elementAt(index).catName);
                    }),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        ImageUrl: articles[index].urlToImage,
                        heading: articles[index].title,
                        content: articles[index].description,
                        url: articles[index].url,
                      );
                    },
                    itemCount: articles.length,
                    scrollDirection: Axis.vertical,
                  ),
                )
              ]),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile({required this.ImageUrl, required this.category});

  final String ImageUrl;

  final String category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategeoryNews(category: category.toLowerCase());
        }));
      },
      child: Container(
          margin: EdgeInsets.only(right: 8, left: 8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedNetworkImage(
                  imageUrl: ImageUrl,
                  height: 80,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 80,
                width: 140,
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
