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
        color: Color(AppColors.DeviceInfoItemBg),
        child: ListView(
          children: <Widget>[
            _findItem(picName: "assets/images/friendQuan.png", text: "朋友圈"),
            Container(
              height: 8,
            ),
            _findItem(picName: "assets/images/saoyisao.png", text: "扫一扫"),
            _grayLine(),
            _findItem(picName: "assets/images/yaoyiyao.png", text: "摇一摇"),
            Container(
              height: 8,
            ),
            _findItem(picName: "assets/images/kanyikan.png", text: "看一看"),
            _grayLine(),
            _findItem(picName: "assets/images/souyisou.png", text: "搜一搜"),
            Container(
              height: 8,
            ),
            _findItem(picName: "assets/images/fujinderen.png", text: "附近的人"),
            _grayLine(),
            _findItem(picName: "assets/images/piaoliuping.png", text: "漂流瓶"),
            Container(
              height: 8,
            ),
            _findItem(picName: "assets/images/gouwu.png", text: "购物"),
            _grayLine(),
            _findItem(picName: "assets/images/youxi.png", text: "游戏"),
            Container(
              height: 8,
            ),
            _findItem(picName: "assets/images/xiaochengxu.png", text: "小程序"),
          ],
        ),
      ),
    );
  }

  Widget _findItem({String picName, String text}) {
    return Container(
      height: 42,
      color: Colors.white,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Container(
              width: 10.0,
            ),
            Image.asset(
              picName,
              width: 20,
              height: 20,
            ),
            Container(
              width: 15.0,
            ),
            Expanded(
              child: Text(text),
            ),
            Icon(IconData(0xe670, fontFamily: Constants.IconFontFamily),
                size: 15.0, color: Colors.black38),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _grayLine() {
    return Row(
      children: <Widget>[
        Container(
          width: 45,
          color: Colors.white,
          height: 1,
        ),
        Container(
          height: 1,
          color: Color(AppColors.DeviceInfoItemBg),
        ),
      ],
    );
  }
}
