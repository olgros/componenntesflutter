import 'package:flutter/material.dart';

class AvatarttPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://c4.wallpaperflare.com/wallpaper/603/698/341/estrellas-planetas-universo-wallpaper-preview.jpg'),
              radius: 25,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.brown,
              ))
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://c4.wallpaperflare.com/wallpaper/603/698/341/estrellas-planetas-universo-wallpaper-preview.jpg'),
          placeholder: AssetImage('assets/jar_loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
