import 'package:flutter/material.dart';

class TalkPageWidget {
  ///AppBar
  Widget appBar(String text, {VoidCallback onPressed,VoidCallback moreOnPressed}) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: onPressed,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_horiz),
          color: Colors.white,
          onPressed: moreOnPressed,
        ),
      ],
    );
  }
}
