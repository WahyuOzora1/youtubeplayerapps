import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeplayerapps/listVideo.dart';
import 'drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playlist Youtube Apps',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Udacoding"),
      ),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icon/icon.JPG'), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Wahyu Restu Pamuji",
                style: TextStyle(
                    fontSize: 25.0, fontFamily: "rashkey", color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
