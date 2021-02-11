import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'drawer.dart';
import 'package:http/http.dart' as http;

class ListVideo extends StatefulWidget {
  final String title; //mengambil data url dan title yang ada di kelas Mydrawer
  final String url;

  ListVideo({this.title, this.url});

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PlayListVideo(
                  list: snapshot.data, //datanya ditampung ke dalam list
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}

class PlayListVideo extends StatelessWidget {
  final List list; //list ini dari snapshot" yang ada di kelas List Video
  PlayListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          //index i ini untuk mengambil list pada index ke berapa berdasrkan json yang bentuknya objek
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => VideoPlay(
                            url:
                                "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}", //embed mengambil, berdasarkan videoId yang ada di bawahnya contents Details
                          ))),
                  child: Container(
                    height: 210,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(list[i]['snippet']['thumbnails']
                                    ['high'][
                                'url']), //mengambil alamat url image yang ada di folder high thumbsnail snippet
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  list[i]['snippet']['title'],
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Divider(),
              ],
            ),
          );
        });
  }
}

class VideoPlay extends StatelessWidget {
  final String url;
  VideoPlay({this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebviewScaffold(
          url: url), //webview scaffol ini berdasarkan pubspec webview plugin
    );
  }
}

/////MEMBACA JSON BIAR MUDAH DI WEB http://jsonviewer.stack.hu/