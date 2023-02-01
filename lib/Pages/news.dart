import 'dart:convert';

import 'package:flutter_application_1/Pages/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<article> list = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=cc10ab289d7a4bfaae76a9874cd6ee43";

    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['description'] != null &&
            element['content'] != null &&
            element['url'] != null) {
          article ar = article(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']);
          list.add(ar);
        }
      });
    }
  }
}

class CategoryyNews {
  List<article> news = [];
  Future<void> getCatNews(String cat) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$cat&apiKey=cc10ab289d7a4bfaae76a9874cd6ee43";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
       if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['description'] != null &&
            element['content'] != null &&
            element['url'] != null) {
          article ar = article(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']);
          news.add(ar);
        }
      });
    }
  }
}
