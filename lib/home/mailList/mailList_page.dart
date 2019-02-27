import 'package:flutter/material.dart';
import '../../model/constants.dart';
import '../../model/mailListBean.dart' show MailListBean, MailListData;
import 'mailList_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MailListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _mialListPage();
  }
}

class _mialListPage extends State<MailListPage> {
  //索引数据
  static const List<String> _indexName = [
    "↑",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  List<GlobalKey> _keys = List<GlobalKey>();
  Map<String, GlobalKey> _indexMap = Map<String, GlobalKey>();
  ScrollController _scrollController = new ScrollController();
  GlobalKey _key;

  //功能型数据
  List<MailListBean> functions = MailListData.functions;

  //联系人数据
  List<MailListBean> beans = MailListData.beans;

  @override
  Widget build(BuildContext context) {
    //索引宽度
    double indexWidth = 20;
    //索引字体大小
    double indexNameSize = 11;
    _indexName.forEach((name) {
      GlobalKey _key = GlobalKey();
      _keys.add(_key);
    });
    //搜索
    Widget _search = Column(
      children: <Widget>[
        Container(
          color: Color(AppColors.DeviceInfoItemBg),
          child: Listener(
            child: Container(
              height: 30,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    IconData(0xe65c, fontFamily: Constants.IconFontFamily),
                    size: 15,
                  ),
                  Text("搜索"),
                ],
              ),
            ),
            onPointerDown: (event) {
              print("点击了搜索！");
            },
          ),
        )
      ],
    );

    //联系人数据
    List<MailListBean> items = List<MailListBean>();
    items.addAll(functions);
    //联系人按照名称顺序排序
    beans.sort((MailListBean a, MailListBean b) {
      return a.nameIndex.compareTo(b.nameIndex);
    });
    items.addAll(beans);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return _search;
                }
                index = index - 1;
                MailListBean bean = items[index];
                //当前组
                bool isGroup = false;
                //当前组末尾一项
                bool isGroupEnd = false;
                bool isListEnd = false;
                if (index >= 1 &&
                    bean.nameIndex == items[index - 1].nameIndex) {
                  isGroup = true;
                }
                if (index + 1 == items.length ||
                    bean.nameIndex != items[index + 1].nameIndex) {
                  isGroupEnd = true;
                  if (index + 1 == items.length) {
                    isListEnd = true;
                  }
                }
                GlobalKey key = GlobalKey();
//                if (bean.nameIndex != null && !isGroup) {
//                  _indexMap[bean.nameIndex] = _key;
//                  RenderBox listBox = _key.currentContext.findRenderObject();
//                  Offset listOffset = listBox.localToGlobal(Offset.zero);
//                  print(bean.nameIndex + "组" + listOffset.toString());
//                }
                return MailListItem(
                  key: key,
                  bean: bean,
                  isGroup: isGroup,
                  isGroupEnd: isGroupEnd,
                  isListEnd: isListEnd,
                  listNum: beans.length,
                );
              },
              itemCount: items.length + 1,
              controller: _scrollController,
            ),
            //索引数据
            Positioned(
              top: 50,
              bottom: 50,
              right: 0,
              child: GestureDetector(
                child: Container(
                  width: indexWidth,
                  color: Colors.black12,
                  child: Column(
                    children: List.generate(_indexName.length, (index) {
                      return Expanded(
                        child: Text(
                          _indexName[index],
                          style: TextStyle(fontSize: indexNameSize),
                          key: _keys[index],
                        ),
                      );
                    }),
                  ),
                ),
                onPanDown: (DragDownDetails e) {
                  print("手指按下了！！！！");
                  print("按下=" + e.globalPosition.toString());
                  for (int i = 0; i < _keys.length; i++) {
                    //获取position
                    RenderBox box = _keys[i].currentContext.findRenderObject();
                    Offset offset = box.localToGlobal(Offset.zero);
                    if (e.globalPosition.dy > offset.dy - indexNameSize / 2 &&
                        e.globalPosition.dy < offset.dy + indexNameSize / 1.1) {
                      print("索引=" + offset.toString());
                      print("手指按下了" + _indexName[i].toString());
                      Fluttertoast.showToast(msg: _indexName[i].toString());
                      //滚动到指定组的位置
//                      GlobalKey listKey = _indexMap[_indexName[i]];
//                      RenderBox listBox =
//                          listKey.currentContext.findRenderObject();
//                      Offset listOffset = listBox.localToGlobal(Offset.zero);
//                      print("滚动到=" + listOffset.toString());
                      _scrollController.animateTo(30 + 45 * 4.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
