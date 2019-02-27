import 'package:flutter/material.dart';
import '../../model/constants.dart';

///发现界面
class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPage();
  }
}

class _FindPage extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            _findItem(),
          ],
        ),
      ),
    );
  }

  Widget _findItem() {
    return Container(
      height: 45,
      color: Colors.white,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Container(
              width: 10.0,
            ),
            Image.asset(
              "assets/images/friendQuan.png",
              width: 20,
              height: 20,
            ),
            Container(
              width: 15.0,
            ),
            Expanded(
              child: Text("朋友圈"),
            ),
            Icon(IconData(0xe670, fontFamily: Constants.IconFontFamily),
                size: 15.0, color: Colors.black38),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
