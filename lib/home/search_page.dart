import 'package:flutter/material.dart';
import '../model/constants.dart' show AppColors, AppStyles, Constants;
import 'package:flutter/cupertino.dart';
import 'converstation_page.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    //搜索项
    final searchItem = Hero(
      tag: 'search',
      child: Container(
        padding:
            EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
        //灰色
        color: Color(AppColors.DeviceInfoItemBg),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                height: Constants.SearchHeight,
                child: Row(
                  children: <Widget>[
                    Container(width: 5.0),
                    //搜索图标
                    Icon(
                      IconData(
                        0xe65c,
                        fontFamily: Constants.IconFontFamily,
                      ),
                      size: 17.0,
                      color: Color(AppColors.DeviceInfoItemIcon),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: '搜索',
                        clearButtonMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(width: 10),
                    Listener(
                      child: Container(
                        width: 40,
                        child: Icon(
                          IconData(0xe611,
                              fontFamily: Constants.IconFontFamily),
                          size: 16,
                          color: Color(AppColors.DesTextColor),
                        ),
                      ),
                      onPointerUp: (event) {
                        print("点击了语音按钮！");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Listener(
              child: Container(
                  height: Constants.SearchHeight,
                  //灰色
                  color: Color(AppColors.DeviceInfoItemBg),
                  child: Row(
                    children: <Widget>[
                      Container(width: 10),
                      Text(
                        "取消",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
              onPointerUp: (event) {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );

    _contentDetail(String text,Alignment align){
      return Expanded(
        child: Container(
          alignment: align,
          child: Text(
            text,
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    }

    //搜索内容项
    final searchContent = Column(
      children: <Widget>[
        Container(height: 20),
        Text(
          "搜索指定内容",
          style: TextStyle(
            color: Color(AppColors.DesTextColor),
          ),
        ),
        Container(height: 20),
        Row(
          children: <Widget>[
            _contentDetail("朋友圈",Alignment.centerRight),
            _contentDetail("文章",Alignment.center),
            _contentDetail("公众号",Alignment.centerLeft),
          ],
        ),
        Container(height: 20),
        Row(
          children: <Widget>[
            _contentDetail("小程序",Alignment.centerRight),
            _contentDetail("音乐",Alignment.center),
            _contentDetail("表情",Alignment.centerLeft),
          ],
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            searchItem,
            searchContent,
          ],
        ),
      ),
    );
  }
}
