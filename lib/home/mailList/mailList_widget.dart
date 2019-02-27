import 'package:flutter/material.dart';
import '../../model/constants.dart';
import '../../model/conversation.dart';


class MailListWidget {


  Widget topItem ({String text,int codePoint,Color color}){
    return Container(
      padding: EdgeInsets.only(left: 15),
      color: Colors.white,
      height: 45,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Icon(
              IconData(codePoint, fontFamily: Constants.IconFontFamily),
              size: 32,
              color: color,
            ),
          ),
          Container(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(text),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Container(
                  height: 1,
                  color: Color(AppColors.DeviceInfoItemBg),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}