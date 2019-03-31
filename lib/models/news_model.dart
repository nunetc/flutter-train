import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/widgets/news.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel extends Model {

  int _selectedIndex = 0;
  var _widgetOptions = [];
  var _isLoading = true;
  File _image;


  NewsModel() {
    var dummyText = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";

    News dogNews = News();
    dogNews.addContent(title: 'This is a dog 1', date: '2019-04-01 01:01:01', imageUrl: 'https://cdn1.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg', content: dummyText);
    dogNews.addContent(title: 'This is a dog 2', date: '2019-04-02 02:02:02', imageUrl: 'https://media2.s-nbcnews.com/j/newscms/2019_13/2799391/190326-gale-staffordshire-dog-missing-cs-1058a_f58f1502ff5a3e32189db1bf583ddf27.fit-760w.jpg', content: dummyText);
    dogNews.addContent(title: 'This is a dog 3', date: '2019-04-03 03:03:03', imageUrl: 'https://i.ytimg.com/vi/C_lpU5DiJ0Y/maxresdefault.jpg', content: dummyText);
    dogNews.addContent(title: 'This is a dog 4', date: '2019-04-04 04:04:04', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXu_xsoJLIvSzxJ9GuH3vM8h9m7uEWRvJ_Fr0aKfCRfpKMntmr', content: dummyText);
    dogNews.addContent(title: 'This is a dog 5', date: '2019-04-05 05:05:05', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr4bf5q_heDO6-FPnyY_2D7NF1rImDBiq9TRi894um-Xc9WenyWA', content: dummyText);

    News catNews = News();
    catNews.addContent(title: 'This is a cat 1', date: '2019-04-01 01:01:01', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYou6kCXs71Rft8YIwrzMWKlTBgqb_Y-5MBN7ehxEnGIlLQttA5Q', content: dummyText);
    catNews.addContent(title: 'This is a cat 2', date: '2019-04-02 02:02:02', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVpuQAe7Q18YBtfdCrgiR7340MBlDh41eAd-4RZSKOAS_fHQtJNA', content: dummyText);
    catNews.addContent(title: 'This is a cat 3', date: '2019-04-03 03:03:03', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3OIvmpXsuw1aahnSBmNXOhA9k0Z-qywsvHIQv1KmwQrR9qRo1', content: dummyText);
    catNews.addContent(title: 'This is a cat 4', date: '2019-04-04 04:04:04', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxXECpsyIyeogB3T8Xrjp0cUkYRnJx9Nh2V3Wv-B35gnt8tadt', content: dummyText);
    catNews.addContent(title: 'This is a cat 5', date: '2019-04-05 05:05:05', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5TH43KjTPkOGsCqmw8hjBcrHO-erQelSZ0FWlA29r0zOoJW92hg', content: dummyText);

    Text fav = Text('Index 2: Favorite');

    _widgetOptions.add(dogNews);
    _widgetOptions.add(catNews);
    _widgetOptions.add(fav);

    loadData();
  }


  Future<void> loadData() async {
    //
    _isLoading = true;
    notifyListeners();

    //
    final response = await http.get("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9ca092c04d544f7ba31ddfef3aff1f29");
    JsonCodec json = JsonCodec();
    var responseJson = json.decode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(responseJson);

    //
    News apiNews = News();
    var articles = newsResponse.articles;
    for (var article in articles) {
      apiNews.addContent(title: article.title, date: article.publishedAt, imageUrl: article.urlToImage, content: article.content);
    }
    _widgetOptions[2] = apiNews;
    _isLoading = false;
    notifyListeners();
  }


  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    _image = image;
    notifyListeners();
  }



  int get selectedIndex => _selectedIndex;
  List get widgetOptions => _widgetOptions;
  bool get isLoading => _isLoading;
  File get image => _image;

}