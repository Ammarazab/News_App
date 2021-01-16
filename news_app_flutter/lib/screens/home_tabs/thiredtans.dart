import 'dart:math';

import "package:flutter/material.dart";

class ThiredTabs extends StatefulWidget {
  @override
  _ThiredTabsState createState() => _ThiredTabsState();
}

class _ThiredTabsState extends State<ThiredTabs> {
  List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.brown,
    Colors.teal,
  ];
  Random _random = Random();
  Color _setcolor() {
    return _colors[_random.nextInt(_colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _autherRow(),
                  SizedBox(
                    height: 16,
                  ),
                  _newsItemRow(),
                ],
              ),
            ),
          ),
        );
      },
      // itemCount: 20,
    );
  }

  Widget _autherRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/bg1.jpg")),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamad Hussin',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("15 Min.", style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      width: 16,
                    ),
                    Text('Life Style', style: TextStyle(color: _setcolor()))
                  ],
                ),
              ],
            )
          ],
        ),
        IconButton(
            icon: Icon(Icons.bookmark_border),
            color: Colors.grey,
            onPressed: () {}),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: ExactAssetImage("assets/bg1.jpg")),
            shape: BoxShape.rectangle,
          ),
          width: 120,
          height: 120,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
            child: Column(
          children: [
            Text(
              'The Word Global Warming Annual Summit',
              maxLines: 2,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, height: 1.5),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'The Word Global Warming Annual Summit The Word Global Warming Annual Summit The Word Global Warming Annual Summit The Word Global Warming Annual Summit',
              style: TextStyle(
                fontSize: 12,
              ),
              maxLines: 5,
            ),
          ],
        )),
      ],
    );
  }
}
