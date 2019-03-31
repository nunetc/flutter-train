import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_detail.dart';

class NewsCard extends StatelessWidget {

  var _title;
  var _date;
  var _imageUrl;
  var _content;

  NewsCard(this._title, this._date, this._imageUrl, this._content);

  void setImageUrl(var imageUrl) {
    this._imageUrl = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Image.network(
              _imageUrl,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsDetail(_title, _date, _imageUrl, _content)),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Text(
              _title,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.0, right: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_date),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    tooltip: 'Read More',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsDetail(_title, _date, _imageUrl, _content)),
                      );
                    },
                  ),
                ],
              )
          )
        ],
      ),
    );
  }

}