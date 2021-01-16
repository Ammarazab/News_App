import 'package:flutter/material.dart';
import 'package:news_app_flutter/screens/guided_pages.dart/about_us.dart';
import 'package:news_app_flutter/screens/guided_pages.dart/contact_us.dart';
import 'package:news_app_flutter/screens/guided_pages.dart/help.dart';
import 'package:news_app_flutter/screens/guided_pages.dart/settings.dart';
import 'package:news_app_flutter/screens/home_tabs/firsttabs.dart';
import 'package:news_app_flutter/screens/home_tabs/secondtabs.dart';
import 'package:news_app_flutter/screens/home_tabs/thiredtans.dart';
import 'package:news_app_flutter/shared_ui/navigation_drawer.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{


  TabController _tabController ;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3 , vsync: this);
  }

  TabBar _tabBar() {
    return TabBar(
      tabs: [
        Tab(
          text: "What's New",
        ),
        Tab(
          text: 'Popular',
        ),
        Tab(
          text: 'Favorite',
        ),
      ],
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _popOutMenu(),
        ],
        bottom: _tabBar(),
      ),
      drawer: Navigatordrawer(),
      body: TabBarView(children: [
        FirstTabs(),
        SecondTabs(),
        ThiredTabs(),
      ],
      controller: _tabController,),
    );
  }
  Widget _popOutMenu() {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('About'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('Contact Us'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('Help'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text('Settings'),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch( menu ){
          case PopOutMenu.ABOUT :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutUs();
            }));
            break;
          case PopOutMenu.SETTINGS:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
            break;
          case PopOutMenu.CONTACT :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Contactus();
            }));
            break;
          case PopOutMenu.HELP :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}