import 'package:flutter/material.dart';
import 'package:test_project/news/screens/all_news_screen.dart';
import 'package:test_project/news/screens/theme_screen.dart';


class TabBarScreen extends StatefulWidget {
  const TabBarScreen ({super.key});

  @override
  State<TabBarScreen > createState() => _TabBarScreen();
}

class _TabBarScreen  extends State<TabBarScreen > {  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        title: const Text("News"),
        bottom:  TabBar(
          labelStyle: Theme.of(context).textTheme.labelMedium,
            tabs: const <Widget>[
              Text(
                "Новости",
              ),
              Text(
                "Избранные"
              ),
              Text(
                "Тема",
              ),
              
            ],
          ),
      ),
      body: const TabBarView(
        children: <Widget>[
            AllNewsScreen(screenType: 1),
            AllNewsScreen(screenType: 2),
            ChooseTheme()
          ],
      ),
      
      ),
    );
    
  }


}