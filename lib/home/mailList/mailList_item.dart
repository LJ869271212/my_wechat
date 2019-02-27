import 'package:flutter/material.dart';
import '../../model/constants.dart';
import '../../model/mailListBean.dart';

class MailListItem extends StatelessWidget {
  final MailListBean bean;
  final bool isGroup;
  final bool isGroupEnd;
  final bool isListEnd;
  final int listNum;

  const MailListItem({
    Key key,
    this.bean,
    this.isGroup = false,
    this.isGroupEnd = false,
    this.isListEnd = false,
    this.listNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (bean.isAvatarFromNet()) {
      avatar = Image.network(
        bean.avatar,
        height: 33,
        width: 33,
      );
    } else {
      avatar = Image.asset(
        bean.avatar,
        height: 33,
        width: 33,
      );
    }
    //按钮项
    Widget _button = Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: Constants.MailItemHeight,
          child: Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(3.0), child: avatar),
              Container(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(bean.name),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    isGroupEnd
                        ? Container()
                        : Container(
                            height: 1,
                            color: Color(AppColors.DeviceInfoItemBg),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        isListEnd
            ? Column(
                children: <Widget>[
                  Container(
                    height: 1,
                    color: Color(AppColors.DeviceInfoItemBg),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      listNum.toString() + "位联系人",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38),
                    ),
                  )
                ],
              )
            : Container(),
      ],
    );

    //分组项
    Widget _item;
    if (bean.nameIndex == null || isGroup) {
      _item = _button;
    } else {
      _item = Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: Constants.MailGroupHeight,
                  color: Color(AppColors.DeviceInfoItemBg),
                  child: Text(
                    bean.nameIndex,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          _button,
        ],
      );
    }

    return _item;
  }
}
