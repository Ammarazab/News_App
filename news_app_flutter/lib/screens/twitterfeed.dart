import 'package:flutter/material.dart';
import 'package:news_app_flutter/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          title: Text('Twitter Feed'),
          centerTitle: false,
        ),
        drawer: Navigatordrawer(),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Card(
                child: Column(
                  children: [_cardHeader(), _cardbody(),_drawLine(), _cardfooter(),
                
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/bg1.jpg'), radius: 24),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Mohamad Mahmoud',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '@mh_mahmoud',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Fri, 12 May 2017 • 14.30',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardbody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Text(
        'We also talk about the future of work as the robots advance, and we ask whether a retro phone',
        style:
            TextStyle(fontSize: 16, height: 1.2, color: Colors.grey.shade900),
      ),
    );
  }

  Widget _cardfooter() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.repeat,
                    size: 28,
                  ),
                  color: Colors.orange,
                  onPressed: () {}),
              Text(
                '25',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SHARE',
                    style: TextStyle(color: Colors.orange),
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'OPEN',
                    style: TextStyle(color: Colors.orange),
                  )),
            ],
          ),
        ],
      ),
    );
  }
    Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only( top: 8 ),
    );
  }

}
