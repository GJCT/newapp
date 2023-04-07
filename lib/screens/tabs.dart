import 'package:flutter/material.dart';
import 'package:newapp/screens/screens.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _) => _NavigationModel(),
      child: Scaffold(
        body: _Screens(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navegationModel.pageActually,
      onTap: (i) => navegationModel.pageActually = i,
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public_outlined), label: 'Populares')
      ]
    );
  }
}

class _Screens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navegationModel.pageController,
      //physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const[
        Tabs1Screen(),
        Tabs2Screen(),
      ],
    );
  }
}

class _NavigationModel extends ChangeNotifier{

  int _pageActually = 0;
  final PageController _pageController = PageController();

  int get pageActually => _pageActually;

  set pageActually(int valor) {
    _pageActually = valor;
    _pageController.animateToPage(
      valor, 
      duration: const Duration(milliseconds: 200), 
      curve: Curves.ease
    );
    notifyListeners();
  }

  PageController get pageController => _pageController;

}