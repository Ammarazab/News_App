import 'package:flutter/material.dart';
import 'package:news_app_flutter/shared_ui/navigation_drawer.dart';

class FacebookFeed extends StatefulWidget {
  @override
  _FacebookFeedState createState() => _FacebookFeedState();
}

class _FacebookFeedState extends State<FacebookFeed> {
  TextStyle _hashTagStyle = TextStyle(color: Colors.orange, fontSize: 12);

  List<int> ids = [0, 2, 7];
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
          title: Text('Facebook Feed'),
          centerTitle: false,
        ),
        drawer: Navigatordrawer(),
        body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListView.builder(itemBuilder: (context, position) {
              return Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _cardHeader(),
                      _drawTitlr(),
                      _drawHashTags(),
                      SizedBox(
                        height: 4,
                      ),
                      _cardbody(),
                      _cardfooter(),
                    ]),
              );
            })));
  }

  Widget _cardHeader() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
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
      ),
      Row(children: [
        IconButton(
          icon: Icon(Icons.thumb_up_off_alt, color: Colors.grey.shade400),
          onPressed: () {},
          // onPressed: () {
          //   if( ids.contains( position ) ){
          //     ids.remove(position);
          //   }else{
          //     ids.add(position);
          //   }
          //   setState(() {

          //   });
          //   print( ids );
          // },
          // color: ( ids.contains(position) ) ? Colors.red : Colors.grey.shade400,
        ),
        Transform.translate(
            offset: Offset(-12, 0),
            child: Text(
              '25',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
            )),
      ])
    ]);
  }

  Widget _drawTitlr() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Text(
        'We also talk about the future of work as the robots',
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          SizedBox(
            height: 14,
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  '#advance',
                  style: _hashTagStyle,
                )),
          ),
          SizedBox(
            height: 14,
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  '#advance',
                  style: _hashTagStyle,
                )),
          ),
          SizedBox(
            height: 14,
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  '#advance',
                  style: _hashTagStyle,
                )),
          ),
        ],
      ),
    );
  }

  Widget _cardbody() {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.8,
        child: Image(
          image: ExactAssetImage('assets/bg1.jpg'),
          fit: BoxFit.cover,
        ));
  }

  Widget _cardfooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              '10 OMMENTS',
              style: _hashTagStyle,
            )),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  'SHARE',
                  style: _hashTagStyle,
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: _hashTagStyle,
                )),
          ],
        ),
      ],
    );
  }
}
