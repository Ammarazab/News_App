import 'dart:math';

import "package:flutter/material.dart";
import 'package:news_app_flutter/models/bourding_home_news.dart';
import 'package:news_app_flutter/utilities/apptheme.dart';

class FirstTabs extends StatefulWidget {
  @override
  _FirstTabsState createState() => _FirstTabsState();
}

class _FirstTabsState extends State<FirstTabs> {
  List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.brown,
    Colors.teal,
  ];
  Random _random = Random();
  Color _setcolor() {
    return _colors[ _random.nextInt(_colors.length)];
  }
  List<BoardingHomeModel> pages;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    _addPages();
    return SingleChildScrollView(
        child: Column(
      children: [
        _images(),
        _topnews(),
        _recently(),
        SizedBox(
          height: 24,
        )
      ],
    ));
  }

  void _addPages() {
    pages = <BoardingHomeModel>[];
    pages.add(BoardingHomeModel(
      'Welcome',
      'assets/bg1.jpg',
      'Making friends is easy as waving your hand back and',
    ));
    pages.add(BoardingHomeModel(
      'Alarm',
      'assets/bg2.jpg',
      'Making friends is easy as waving your hand back and',
    ));
    pages.add(BoardingHomeModel(
      'Print',
      'assets/bg3.jpg',
      'Making friends is easy as waving your hand back and',
    ));
    pages.add(BoardingHomeModel(
      'Map',
      'assets/bg4.jpg',
      'Making friends is easy as waving your hand back and',
    ));
  }

  Widget _topnews() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 4),
                child: Text("Top Story"),
              ),
              Card(
                child: Column(
                  children: [
                    _topstory(),
                    _divider(),
                    _topstory(),
                    _divider(),
                    _topstory()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recently() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 4),
                child: Text('Recent Update'),
              ),
              _recentnews(),
              _recentnews(),
              _recentnews()
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey[300],
    );
  }

  Widget _recentnews() {
    return Card(
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image(
                    image: ExactAssetImage('assets/bg1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 2, left: 24, right: 24),
                          child: Text(
                            'Break',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _setcolor()),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'The Word Global Warming Annual Summit',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.grey,
                                size: 15,
                              ),
                              Text(
                                'From 10 minuts',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topstory() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 100.00,
                height: 100.00,
                child: Image(
                  image: ExactAssetImage('assets/bg1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Word Global Warming Annual Summit',
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Mohamad Ahmad',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                  Text(
                                    'From 10 minuts',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _images() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: PageView.builder(
          itemBuilder: (context, index) {
            return Stack(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      pages[index].image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Transform.translate(
                  offset: Offset(0, 90),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pages[index].title,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                pages[index].description,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration:
                          BoxDecoration(color: AppTheme.appTheme.primaryColor),
                    ),
                  ))
            ]);
          },
          itemCount: pages.length,
          onPageChanged: (index) {
            _pageViewNotifier.value = index;
          },
        ));
  }
}
