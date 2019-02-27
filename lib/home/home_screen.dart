import 'package:flutter/material.dart';
import 'package:my_wechat/model/constants.dart' show Constants, AppColors;
import 'converstation_page.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:my_wechat/home/mailList/mailList_page.dart';

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            title: Text(title),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  List<NavigationIconView> _navgationViews;
  int _currentIndex = 0;
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _navgationViews = [
      NavigationIconView(
          title: '微信',
          icon: IconData(0xe601, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe618, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(0xe602, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe72a, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '发现',
          icon: IconData(0xe60d, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe600, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '我',
          icon: IconData(0xe605, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe685, fontFamily: Constants.IconFontFamily)),
    ];
    _pageController = PageController(initialPage: _currentIndex);
    //四个界面
    _pages = [
      //微信绘画界面
      ConverstationPage(),
      MailListPage(),
      Container(color: Colors.blue),
      Container(color: Colors.blueGrey),
    ];
  }

  _buildPopuMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(iconName, fontFamily: Constants.IconFontFamily),
            size: 22.0, color: const Color(AppColors.AppBarPopupMenuColor)),
        Container(width: 12.0),
        Text(
          title,
          style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navgationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.jumpToPage(_currentIndex);
        });
      },
    );

    Future scan() async {
      try {
        String barcode = await BarcodeScanner.scan();
        setState(() {
          print("barcode----->" + barcode);
          return barcode;
        });
      } on PlatformException catch (e) {
        if (e.code == BarcodeScanner.CameraAccessDenied) {
          setState(() {
            return "The user did not grant the camera permission!";
          });
        } else {
          setState(() {
            return 'Unknown error: $e';
          });
        }
      } on FormatException {
        setState(() =>
            'null (User returned using the "back"-button before scanning anything. Result)');
      } catch (e) {
        setState(() => 'Unknown error: $e');
      }
    }

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('微信'),
          elevation: 0.0,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<ActionItems>>[
                  PopupMenuItem(
                    child: _buildPopuMenuItem(0xe604, '发起群聊'),
                    value: ActionItems.GROUP_CHAT,
                  ),
                  PopupMenuItem(
                    child: _buildPopuMenuItem(0xe61d, '添加朋友'),
                    value: ActionItems.ADD_FRIEND,
                  ),
                  PopupMenuItem(
                    child: _buildPopuMenuItem(0xe64c, '扫一扫'),
                    value: ActionItems.QR_SCAN,
                  ),
                  PopupMenuItem(
                    child: _buildPopuMenuItem(0xe603, '收付款'),
                    value: ActionItems.PAYMENT,
                  ),
                  PopupMenuItem(
                    child: _buildPopuMenuItem(0xe63d, '帮助与反馈'),
                    value: ActionItems.HELP,
                  )
                ];
              },
              icon:
                  Icon(IconData(0xe607, fontFamily: Constants.IconFontFamily)),
              onSelected: (ActionItems selected) {
                print('点击的是$selected');
                if (selected == ActionItems.QR_SCAN) {
                  print(scan());
                }
              },
            ),
            Container(width: 16.0)
          ],
        ),
        body: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _pages[index];
          },
          controller: _pageController,
          itemCount: _pages.length,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: botNavBar,
      ),
    );
  }
}
