import 'package:flutter/material.dart';
import 'package:news_app_flutter/screens/home_tabs/secondtabs.dart';
import 'package:news_app_flutter/screens/home_tabs/thiredtans.dart';
import 'package:news_app_flutter/shared_ui/navigation_drawer.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
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
        title: Text("HedLine News"),
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
      body: TabBarView(
        children: [
          ThiredTabs(),
          SecondTabs(),
          ThiredTabs(),
        ],
        controller: _tabController,
      ),
    );
  }
}
