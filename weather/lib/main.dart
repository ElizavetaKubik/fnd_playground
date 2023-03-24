// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRating(),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget _headerImage() {
  return Image(
    image: NetworkImage(
        'https://global.unitednations.entermediadb.net/assets/mediadb/services/module/asset/downloads/preset/Libraries/Production%20Library/23-12-2022_WMO_Bosnia-Herzegovina.jpg/image1170x530cropped.jpg'),
    fit: BoxFit.cover,
  );
}

Widget _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Monday - May 23",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        style: TextStyle(color: Colors.black54),
      )
    ],
  );
}

Widget _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wb_sunny,
        color: Colors.yellow,
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '15 Clear',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Minsk, Belarus',
                  style: TextStyle(color: Colors.deepPurple)),
            ],
          )
        ],
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
      spacing: 10,
      children: List.generate(8, (int index) {
        return Chip(
          label: Text(
            '${index + 20}C',
            style: TextStyle(fontSize: 15),
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }));
}

Widget _footerRating() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black12,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black12,
      )
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Info with weather.com         ',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      stars
    ],
  );
}
