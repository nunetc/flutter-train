import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {

  final _title;
  final _date;
  final _imageUrl;
  var _content;

  NewsDetail(this._title, this._date, this._imageUrl, this._content) {
    // _content = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              _imageUrl,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Text(
                _title,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Text(
                  _content
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, 'response data here');
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      )


//      body: ListView(
//        children: <Widget>[
//          Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Image.network(
//                _imageUrl,
//              ),
//              Padding(
//                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//                child: Text(
//                  _title,
//                  style: TextStyle(fontSize: 25),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
//                child: Text(
//                    _content
//                ),
//              ),
//              RaisedButton(
//                onPressed: () {
//                  Navigator.pop(context, 'response data here');
//                },
//                child: Text('Go back!'),
//              ),
//            ],
//          ),
//        ],
//      ),


//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Go back!'),
//        ),
//      ),
    );
  }

}