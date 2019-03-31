import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_card.dart';

class News extends StatelessWidget {

  final newsCards = <Widget>[];

//  void addContent(var title, var date, var imageUrl) {
//    newsContents.add(NewsContent(title, date, imageUrl));
//  }

  void addContent({ Key key, var title, var date, var imageUrl, var content }) {
    newsCards.add(NewsCard(title, date, imageUrl, content));
  }

  @override
  Widget build(BuildContext context) {

//    return ListView.builder(
//      itemCount: newsContents.length,
//      itemBuilder: (BuildContext context, int index) {
//        return newsContents[index];
//      },
//    );

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),

      controller: new ScrollController(),

      children: newsCards,
    );
  }

}