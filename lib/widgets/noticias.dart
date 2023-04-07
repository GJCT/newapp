import 'package:flutter/material.dart';
import 'package:newapp/models/news.dart';
import 'package:newapp/theme/thema.dart';

class Noticias extends StatelessWidget {

  final List<Article> noticias;

  const Noticias(this.noticias );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return _Noticieros(
          noticia: noticias[index],
          index: index,
        );
      }
    );
  }
}

class _Noticieros extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticieros({Key key, this.noticia, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetBar(
          noticia: noticia,
          index: index,
        ),
        _TarjetTitle(
          noticia: noticia,
        ),
        _TarjetImg( 
          noticia: noticia
        ),
        _TarjetBody(
          noticia: noticia,
        ),
        _TarjetBottom(),

        const SizedBox(height: 10,),
        const Divider(),
      ],
    );
  }
}

class _TarjetBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {
              
            },
            fillColor: miTheme.indicatorColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),

          const SizedBox(width: 25),

          RawMaterialButton(
            onPressed: () {
              
            },
            fillColor: Colors.indigo[900],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more_outlined),
          ),
        ],
      ),
    );
  }
}

class _TarjetBody extends StatelessWidget {

  final Article noticia;

  const _TarjetBody({
    Key key, this.noticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _TarjetImg extends StatelessWidget {

  final Article noticia;
  
  const _TarjetImg({
    Key key, this.noticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null) 
          ? 
            FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage(noticia.urlToImage),
          ) 
          :
          const Image(image: AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }
}

class _TarjetTitle extends StatelessWidget {
  
  final Article noticia;

  const _TarjetTitle({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(noticia.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetBar({
    Key key, this.noticia, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}.', style: TextStyle(color: miTheme.indicatorColor)),
          Text('${noticia.source.name}.')
        ],
      ),
    );
  }
}