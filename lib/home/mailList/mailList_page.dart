import 'package:flutter/material.dart';
import '../../model/constants.dart';
import '../../model/mailListBean.dart' show MailListBean, MailListData;
import 'mailList_item.dart';

///通讯录
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
  Map<String, int> _indexMap = Map<String, int>();
  List<String> _indexList = List<String>();
  ScrollController _scrollController = new ScrollController();
  Color _indexColor = Colors.transparent;

  //功能型数据
  List<MailListBean> functions = MailListData.functions;

  //联系人数据
  List<MailListBean> beans = MailListData.beans;

  //联系人数据
  List<MailListBean> items;
  int _dy;
  String _selectIndexName = "";
  bool _isShowSelect = false;
  double _IndexTop = 0.0;

  @override
  void initState() {
    super.initState();

    _indexName.forEach((name) {
      GlobalKey _key = GlobalKey();
      _keys.add(_key);
    });

    //联系人数据
    items = List<MailListBean>();
    items.addAll(functions);
    //联系人按照名称顺序排序
    beans.sort((MailListBean a, MailListBean b) {
      return a.nameIndex.compareTo(b.nameIndex);
    });
    items.addAll(beans);

    for (int i = 0; i < items.length; i++) {
      MailListBean bean = items[i];
      //判断是组第一项,设置每一组的第一项位置，用于索引滑动
      if (i > 0 && bean.nameIndex != items[i - 1].nameIndex) {
        _indexMap[bean.nameIndex] = i;
        _indexList.add(bean.nameIndex);
      }
    }
    print(_indexMap.toString());
    print(_indexList.toString());
  }

  @override
  Widget build(BuildContext context) {
    //索引宽度
    double indexWidth = 20;
    //搜索
    Widget _search = Column(
      children: <Widget>[
        Container(
          color: Color(AppColors.DeviceInfoItemBg),
          child: Listener(
            child: Container(
              height: Constants.SearchHeight,
              margin: EdgeInsets.all(Constants.SearchMargin),
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
                return MailListItem(
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
            //显示选中的indexName
            _isShowSelect
                ? Positioned(
                    right: 50,
                    top: _IndexTop - 100.0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Icon(
                              IconData(0xe93b,
                                  fontFamily: Constants.IconFontFamily),
                              color: Colors.black12,
                              size: 50,
                            ),
                          ),
                          Center(
                            child: Text(_selectIndexName,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            //索引数据
            Positioned(
              top: 50,
              bottom: 50,
              right: 0,
              child: GestureDetector(
                child: Container(
                  width: indexWidth,
                  color: _indexColor,
                  child: Column(
                    children: List.generate(_indexName.length, (index) {
                      return Expanded(
                        child: Text(
                          _indexName[index],
                          style: TextStyle(fontSize: Constants.indexNameSize),
                          key: _keys[index],
                        ),
                      );
                    }),
                  ),
                ),
                onPanDown: (DragDownDetails e) {
                  setState(() {
                    _indexColor = Colors.black12;
                    _isShowSelect = true;
                  });
                  print("按下位置=" + e.globalPosition.toString());
                  _animateTo(e.globalPosition.dy.toInt());
                },
                onPanUpdate: (DragUpdateDetails e) {
                  if (_dy != e.globalPosition.dy.toInt()) {
                    print("滑动位置=" + e.globalPosition.toString());
                    _dy = e.globalPosition.dy.toInt();
                    _animateTo(e.globalPosition.dy.toInt());
                  }
                },
                onPanEnd: (DragEndDetails e) {
                  setState(() {
                    _indexColor = Colors.transparent;
                    _isShowSelect = false;
                  });
                  print("滑动结束");
                },
                onPanCancel: () {
                  setState(() {
                    _indexColor = Colors.transparent;
                    _isShowSelect = false;
                  });
                  print("滑动Cancel");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _animateTo(int dy) {
    for (int i = 0; i < _keys.length; i++) {
      //获取position
      RenderBox box = _keys[i].currentContext.findRenderObject();
      Offset offset = box.localToGlobal(Offset.zero);
      bool isOffset = dy > offset.dy - Constants.indexNameSize / 2 &&
          dy < offset.dy + Constants.indexNameSize / 1.1;
      if (isOffset) {
        String indexName = _indexName[i];
        print("索引=" + offset.toString());
        print("手指按下了" + indexName);
//        Fluttertoast.showToast(msg: indexName);
        setState(() {
          _selectIndexName = indexName;
          _IndexTop = offset.dy;
        });
        if (indexName == "↑") {
          _scrollController.animateTo(0.0,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
          return;
        }
        //滚动到指定组的位置
        int index = _indexMap[indexName];
        int count;
        for (int j = 0; j < _indexList.length; j++) {
          if (_indexList[j] == indexName) {
            count = j;
            break;
          }
        }
        _scrollController.animateTo(
            Constants.SearchHeight +
                Constants.SearchMargin * 2 +
                Constants.MailItemHeight * index +
                count * Constants.MailGroupHeight,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease);
      }
    }
  }
}
