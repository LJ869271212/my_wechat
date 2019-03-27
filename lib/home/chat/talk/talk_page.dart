import 'package:flutter/material.dart';
import 'package:my_wechat/model/constants.dart';
import 'package:my_wechat/model/conversation.dart';
import 'talk_page_widget.dart';

///谈话界面
class TalkPage extends StatefulWidget {
  final Conversation conversation;

  const TalkPage({Key key, this.conversation}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TalkPage();
  }
}

class _TalkPage extends State<TalkPage> {
  List<Widget> _itemWidget = [];

  @override
  Widget build(BuildContext context) {
    TalkPageWidget _widget = TalkPageWidget();

    return Scaffold(
      appBar: _widget.appBar(widget.conversation.title, onPressed: () {
        Navigator.pop(context);
      }, moreOnPressed: () {
        print("点击了更多");
      }),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            bottom: 50,
            left: 0,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _itemWidget[index];
              },
              itemCount: _itemWidget.length,
            ),
          ),

          ///底部布局
          Positioned(
            bottom: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 50.0,
              color: Color(AppColors.DeviceInfoItemBg),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.keyboard_voice),
                      color: Colors.white,
                    ),
                  ),

                  ///输入框
                  Expanded(
                      flex: 6,
                      child: Container(
                        color: Colors.white,
                        child: TextField(
                          textInputAction: TextInputAction.send,
                          decoration: InputDecoration(
                            hintText: "请填写",
                            contentPadding:
                                EdgeInsets.only(top: 8.0, bottom: 8.0),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onSubmitted: (text) {
                            _itemWidget.add(_widget.itemWidget(
                                context: context,
                                isMe: true,
                                text: text,
                                conversation: widget.conversation));
                          },
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
