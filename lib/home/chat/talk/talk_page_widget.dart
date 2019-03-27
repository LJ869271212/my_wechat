import 'package:flutter/material.dart';
import 'package:my_wechat/model/constants.dart';
import 'package:my_wechat/model/conversation.dart';

class TalkPageWidget {
  ///AppBar
  Widget appBar(String text,
      {VoidCallback onPressed, VoidCallback moreOnPressed}) {
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

  Widget itemWidget(
      {@required BuildContext context,
      bool isMe,
      String text,
      Conversation conversation}) {
    // 根据图片的获取方式初始化头像组件
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    } else {
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }

    print("------>" + text.length.toString());
    Widget itemWidget = Container(
      margin: EdgeInsets.only(right: 10.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 100),
                decoration: new BoxDecoration(
                    color: Colors.green,
                    borderRadius: new BorderRadius.circular(5.0)),
                child: Text(text)),
          ),
          Container(
            child: Icon(
              IconData(0xe928, fontFamily: Constants.IconFontFamily),
              size: 8,
              color: Colors.green,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0), child: avatar),
          ),
        ],
      ),
    );

    return itemWidget;
  }
}
