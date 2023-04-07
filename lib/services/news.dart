import 'package:flutter/material.dart';
import 'package:newapp/models/category.dart';
import 'package:newapp/models/news.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NewsServices extends ChangeNotifier{

  final _urlBase  = 'https://newsapi.org/v2';
  final _apiKey   = '24a463b291314391b362a6c866830415';
  
  List<Article> headlines = [];
  String _category = 'sport';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.baseball, 'sport'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};


  NewsServices () {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
    getArticleByCategory(category);
  }

  get category => _category;
  set category(String valor) {
    _category = valor;
    getArticleByCategory(valor);
    notifyListeners();
  }

  List<Article> get getCategorySelect => categoryArticles[category];

  getTopHeadlines() async{

    final url = Uri.parse('$_urlBase/top-headlines?apiKey=$_apiKey&country=co');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    
    headlines.addAll(newsResponse.articles);
    notifyListeners();

  }

  getArticleByCategory(String category) async{

    if(categoryArticles[category].isNotEmpty) return categoryArticles[category];

    final url = Uri.parse('$_urlBase/top-headlines?apiKey=$_apiKey&country=co&category=$category');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category].addAll(newsResponse.articles);
    
    notifyListeners();
  }

}