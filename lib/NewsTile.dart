import 'package:flutter/material.dart';

import 'Pages/article_view.dart';

class NewsTile extends StatelessWidget {
  NewsTile(
      {required this.ImageUrl,
      required this.heading,
      required this.content,
      required this.url});
  final url;
  final heading;
  final ImageUrl;
  final content;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleView(blogUrl: url);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                ImageUrl,
              ),
            ),
            Text(
              heading,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              content,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
