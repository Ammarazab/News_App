import 'package:flutter/material.dart';
import 'package:news_app_flutter/screens/home_tabs/firsttabs.dart';
import 'package:news_app_flutter/screens/home_tabs/secondtabs.dart';
import 'package:news_app_flutter/screens/home_tabs/thiredtans.dart';
import 'package:news_app_flutter/shared_ui/navigation_drawer.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

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
          // icon: Icon(Icons.new_releases_outlined) ,
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
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
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
}