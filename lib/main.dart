import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newapp/screens/screens.dart';
import 'package:newapp/services/news.dart';
import 'package:newapp/theme/thema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light );
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _) => NewsServices()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const TabsScreen(),
        theme: miTheme,
      ),
    );
  }
}