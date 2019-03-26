import 'package:flutter/material.dart';
import 'package:my_wechat/model/constants.dart';
import 'talk_page_widget.dart';

///谈话界面
class TalkPage extends StatefulWidget {
  final String name;

  const TalkPage({Key key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TalkPage();
  }
}

class _TalkPage extends State<TalkPage> {
  @override
  Widget build(BuildContext context) {
    TalkPageWidget _widget = TalkPageWidget();

    return Scaffold(
      appBar: _widget.appBar(widget.name, onPressed: () {
        Navigator.pop(context);
      }, moreOnPressed: () {
        print("点击了更多");
      }),
      body: Stack(
        alignment:Alignment.center ,
        children: <Widget>[
          Positioned(
            bottom: 0,
            left:0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Color(AppColors.DeviceInfoItemBg),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.keyboard_voice),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "请填写",
                            contentPadding:
                                EdgeInsets.only(top: 8.0, bottom: 8.0),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      )),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.insert_emoticon),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
