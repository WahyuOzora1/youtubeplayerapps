import 'package:flutter/material.dart';
import 'listVideo.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.video_collection),
              title: Text(
                "Udacoding",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListVideo(
                            //Mengirim data ke List video dengan parameter atau acuan url dan title seperti itu
                            url:
                                "https://youtubeplaylistudacodingwahyu.herokuapp.com/", //kode jsonnnya
                            title: "Udacoding",
                          ))),
            ),
          ],
        ),
      ),
    );
  }
}
