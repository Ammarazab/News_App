import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/bourding_model.dart';
import 'package:news_app_flutter/screens/home.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<BoardingModel> pages;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = <BoardingModel>[];
    pages.add(BoardingModel(
        'Welcome',
        '1- Making friends is easy as waving your hand back and forth in easy step',
        Icons.open_in_new_sharp,
        'assets/bg1.jpg'));
    pages.add(BoardingModel(
        'Alarm',
        '2- Making friends is easy as waving your hand back and forth in easy step',
        Icons.healing_outlined,
        'assets/bg2.jpg'));
    pages.add(BoardingModel(
        'Print',
        '3- Making friends is easy as waving your hand back and forth in easy step',
        Icons.map,
        'assets/bg3.jpg'));
    pages.add(BoardingModel(
        'Map',
        '4- Making friends is easy as waving your hand back and forth in easy step',
        Icons.ac_unit,
        'assets/bg4.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return MaterialApp(
        home: Stack(children: [
      Scaffold(
          body: PageView.builder(
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      pages[index].image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.translate(
                    child: Icon(
                      pages[index].icon,
                      size: 150,
                      color: Colors.white,
                    ),
                    offset: Offset(0, -100),
                  ),
                  Text(
                    pages[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 48, right: 48, top: 18),
                    child: Text(
                      pages[index].description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: pages.length,
        onPageChanged: (index) {
          _pageViewNotifier.value = index;
        },
      )),
      Transform.translate(
        offset: Offset(0, 175),
        child: Align(
          alignment: Alignment.center,
          child: _pageIndicators(pages.length),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: (MediaQuery.of(context).size.width - 16),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                _goto_home();
                return HomeScreen();
              }));
            },
            color: Colors.red,
            child: Text(
              "Get Strat",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
          ),
        ),
      ),
    ]));
  }

  Widget _pageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _goto_home() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
