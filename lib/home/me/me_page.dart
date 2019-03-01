import 'package:flutter/material.dart';
import '../../model/constants.dart';

///我的界面
class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MePage();
  }
}

class _MePage extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(AppColors.DeviceInfoItemBg),
        child: ListView(
          children: <Widget>[
            _meTopItem(),
            Container(height: 8),
            _findItem(picName: "assets/images/zhifu.png", text: "支付"),
            Container(height: 8),
            _findItem(picName: "assets/images/shoucang.png", text: "收藏"),
            _grayLine(),
            _findItem(picName: "assets/images/xinagce.png", text: "相册"),
            _grayLine(),
            _findItem(picName: "assets/images/kabao.png", text: "卡包"),
            _grayLine(),
            _findItem(picName: "assets/images/biaoqing.png", text: "表情"),
            Container(height: 8),
            _findItem(picName: "assets/images/shezhi.png", text: "设置"),
          ],
        ),
      ),
    );
  }

  Widget _meTopItem() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      height: 84,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(width: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Image.network(
              "https://randomuser.me/api/portraits/women/21.jpg",
              height: 50,
              width: 50,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              height: 50,
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Jerry Castro",style: TextStyle(fontSize: 25),),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "微信号：Jerry Castro",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      )),
                      Image.asset(
                        "assets/images/erweima.png",
                        height: 16,
                        width: 16,
                      ),
                      Container(width: 10,)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Icon(IconData(0xe670, fontFamily: Constants.IconFontFamily),
              size: 15.0, color: Colors.black38),
        ],
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
