import 'package:flutter/material.dart';
import '../model/constants.dart' show AppColors, AppStyles, Constants;
import '../model/conversation.dart'
    show Conversation, Device, ConversationPageData;
import './search_page.dart';

///微信会话列表项
class _ConverstationItem extends StatelessWidget {
  const _ConverstationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  //会话实体
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
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

    Widget avatarContainer;
    if (conversation.unreadMsgCount > 0) {
      //未读消息角标
      Widget unreadMsgCountText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        height: Constants.UnReadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(
          conversation.unreadMsgCount.toString(),
          style: AppStyles.UnreadMsgCountDotStyle,
        ),
      );

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText,
          ),
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBg),
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor),
            width: Constants.DividerWidth,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(conversation.title, style: AppStyles.TitleStyle),
                Text(conversation.title, style: AppStyles.TitleStyle)
              ],
            ),
          ),
          Container(width: 10.0),
        ],
      ),
    );
  }
}

///搜索框项
class _SearchInfoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding:
            EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
        color: Color(AppColors.DeviceInfoItemBg),
        child: Hero(
          tag: 'search',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(AppColors.NotifyDotText),
            ),
            height: Constants.SearchHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Listener(
                    child: AbsorbPointer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            IconData(
                              0xe65c,
                              fontFamily: Constants.IconFontFamily,
                            ),
                            size: 17.0,
                            color: Color(AppColors.DeviceInfoItemIcon),
                          ),
                          SizedBox(width: 5.0),
                          Text('搜索',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(AppColors.DesTextColor),
                              )),
                        ],
                      ),
                    ),
                    onPointerUp: (event) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        //跳转至搜索界面
                        return SearchPage();
                      }));
                    },
                  ),
                ),
                Material(
                  color: Colors.white,
                  child: IconButton(
                      icon: Icon(
                        IconData(0xe611, fontFamily: Constants.IconFontFamily),
                        size: 16,
                        color: Color(AppColors.DesTextColor),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          //跳转至搜索界面
                          return SearchPage();
                        }));
                      }),
                ),
                Container(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///登录设备信息项
class _DeviceInfoItem extends StatelessWidget {
  const _DeviceInfoItem({this.device: Device.WIN}) : assert(device != null);

  final Device device;

  int get iconName {
    return device == Device.WIN ? 0xe7fb : 0xe61b;
  }

  String get deviceName {
    return device == Device.WIN ? "Windows" : "Mac";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth,
            color: Color(AppColors.DividerColor),
          ),
        ),
        color: Color(AppColors.DeviceInfoItemBg),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center, //沿主轴方向居中
        children: <Widget>[
          Icon(
            IconData(
              this.iconName,
              fontFamily: Constants.IconFontFamily,
            ),
            size: 24.0,
            color: Color(AppColors.DeviceInfoItemIcon),
          ),
          SizedBox(width: 24.0),
          Text('$deviceName 微信已登录，手机通知已关闭',
              style: AppStyles.DeviceInfoItemTextStyle)
        ],
      ),
    );
  }
}

///微信会话界面
class ConverstationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConversationPageState();
  }
}

class _ConversationPageState extends State<ConverstationPage> {
  final ConversationPageData data = ConversationPageData.mock();

  @override
  Widget build(BuildContext context) {
    var mockConversations = data.conversations;

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _SearchInfoItem();
        } else if (index == 1 && data.device != null) {
          //需要显示其他设备的登录信息
          return _DeviceInfoItem(device: data.device);
        }
        return _ConverstationItem(conversation: mockConversations[index - 2]);
      },
      itemCount: data.device != null
          ? mockConversations.length + 2
          : mockConversations.length,
    );
  }
}
