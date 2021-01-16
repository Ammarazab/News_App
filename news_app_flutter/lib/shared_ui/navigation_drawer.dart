import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/map_menu.dart';
import 'package:news_app_flutter/screens/headline_news.dart';
import 'package:news_app_flutter/screens/home.dart';
import 'package:news_app_flutter/screens/twitterfeed.dart';

class Navigatordrawer extends StatefulWidget {
  @override
  _NavigatordrawerState createState() => _NavigatordrawerState();
}

class _NavigatordrawerState extends State<Navigatordrawer> {
  List<NavMenuItem> navigationmenu = [
    NavMenuItem('Explore', () => HomeScreen()),
    NavMenuItem('Headline News', () => HeadLineNews()),
    NavMenuItem('Twitter Feed', () => TwitterFeed()),
    NavMenuItem('Read Later', () => HomeScreen()),
    NavMenuItem('Videos', () => HeadLineNews()),
    NavMenuItem('Photos', () => HomeScreen()),
    NavMenuItem('Setting', () => HeadLineNews()),
    NavMenuItem('Logout', () => HeadLineNews()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(top: 75.0, left: 24),
      child: ListView.builder(
        itemBuilder: (context, position) {
          return ListTile(
            title: Text(
              navigationmenu[position].title,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return navigationmenu[position].destiation();
              }));
            },
          );
        },
        itemCount: navigationmenu.length,
      ),
    ));
  }
}
