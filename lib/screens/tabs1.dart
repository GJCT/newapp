import 'package:flutter/material.dart';
import 'package:newapp/services/news.dart';
import 'package:newapp/widgets/noticias.dart';
import 'package:provider/provider.dart';

class Tabs1Screen extends StatefulWidget {

  const Tabs1Screen({Key key}) : super(key: key);

  @override
  State<Tabs1Screen> createState() => _Tabs1ScreenState();
}

class _Tabs1ScreenState extends State<Tabs1Screen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsServices>(context).headlines;

    return Scaffold(
      body: (headlines.isEmpty)
      ?
      const Center(
        child: CircularProgressIndicator(),
      )
      :
      Noticias(headlines)
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}