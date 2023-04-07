import 'package:flutter/material.dart';
import 'package:newapp/models/category.dart';
import 'package:newapp/services/news.dart';
import 'package:newapp/theme/thema.dart';
import 'package:newapp/widgets/noticias.dart';
import 'package:provider/provider.dart';

class Tabs2Screen extends StatelessWidget {
   
  const Tabs2Screen({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsServices>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             _ListaCategory(),
             Expanded(
              child: Noticias(newsServices.getCategorySelect)
             )
          ],
        )
      ),
    );
  }
}

class _ListaCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final categories = Provider.of<NewsServices>(context).categories;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 87,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryIcon(categories[index]),
                const SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          );
        }
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {

  final Category categories;

  const _CategoryIcon(this.categories);

  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsServices>(context);

    return GestureDetector(
      onTap: () => newsServices.category = categories.name,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categories.icon,
          color: (newsServices.category == categories.name)
          ? miTheme.indicatorColor : Colors.black87
        ),
      ),
    );
  }
}