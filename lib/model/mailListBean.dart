import 'package:flutter/material.dart';

class MailListBean {
  final String avatar;
  final String name;
  final String nameIndex;

  MailListBean({@required this.avatar, @required this.name, this.nameIndex});

  bool isAvatarFromNet() {
    if (this.avatar.indexOf("http") == 0 || this.avatar.indexOf("https") == 0) {
      return true;
    }
    return false;
  }
}

class MailListData {

  static List<MailListBean> functions = [
    MailListBean(
      avatar: 'assets/images/xindepengyou.png',
      name: '新的朋友',
    ),
    MailListBean(
      avatar: 'assets/images/qunliao.png',
      name: '群聊',
    ),
    MailListBean(
      avatar: 'assets/images/weixinbiaoqian.png',
      name: '标签',
    ),
    MailListBean(
      avatar: 'assets/images/gongzhonghaotubiao.png',
      name: '公众号',
    ),
  ];

  static List<MailListBean> beans = [
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/71.jpg',
      name: 'Qax Reid',
      nameIndex: "Q",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/93.jpg',
      name: 'Zverett Lambert',
      nameIndex: "Z",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/59.jpg',
      name: 'Yally Dixon',
      nameIndex: "Y",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/29.jpg',
      name: 'Genesis Reid',
      nameIndex: "X",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/83.jpg',
      name: 'Uimmy Hansen',
      nameIndex: "U",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/35.jpg',
      name: 'Rdward Carlson',
      nameIndex: "R",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/51.jpg',
      name: 'Oilda George',
      nameIndex: "O",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/27.jpg',
      name: 'Niam Berry',
      nameIndex: "N",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/6.jpg',
      name: 'Iayne Cox',
      nameIndex: "I",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/31.jpg',
      name: 'Glenda Oliver',
      nameIndex: "G",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/48.jpg',
      name: 'Harry Fisher',
      nameIndex: "H",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/42.jpg',
      name: 'Violet Rice',
      nameIndex: "V",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/95.jpg',
      name: 'Daniel Turner',
      nameIndex: "D",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/98.jpg',
      name: 'Jeremy Fisher',
      nameIndex: "J",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/14.jpg',
      name: 'Wesley Howard',
      nameIndex: "W",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
      name: 'Holly Burns',
      nameIndex: "H",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/82.jpg',
      name: 'Andre Romero',
      nameIndex: "A",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/52.jpg',
      name: 'Bernard Newman',
      nameIndex: "B",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      name: '汤姆丁',
      nameIndex: "T",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      name: 'Tina Morgan',
      nameIndex: "T",
    ),
    MailListBean(
      avatar: 'assets/images/ic_fengchao.png',
      name: '蜂巢智能柜',
      nameIndex: "F",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      name: 'Lily',
      nameIndex: "L",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      name: '汤姆丁',
      nameIndex: "T",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      name: 'Tina Morgan',
      nameIndex: "T",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      name: 'Lily',
      nameIndex: "L",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      name: '汤姆丁',
      nameIndex: "T",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      name: 'Tina Morgan',
      nameIndex: "T",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      name: 'Lily',
      nameIndex: "L",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/88.jpg',
      name: 'Max Freeman',
      nameIndex: "M",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/70.jpg',
      name: 'Lee Lawrence',
      nameIndex: "L",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/58.jpg',
      name: 'emma edwards',
      nameIndex: "E",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
      name: 'Leslie Hall',
      nameIndex: "L",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/88.jpg',
      name: 'Christian Griffin',
      nameIndex: "C",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/19.jpg',
      name: 'marie duncan',
      nameIndex: "M",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/24.jpg',
      name: 'Philip Harris',
      nameIndex: "P",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/53.jpg',
      name: 'Ella Diaz',
      nameIndex: "E",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/0.jpg',
      name: 'Marion Austin',
      nameIndex: "M",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/women/81.jpg',
      name: 'Shannon Taylor',
      nameIndex: "S",
    ),
    MailListBean(
      avatar: 'https://randomuser.me/api/portraits/men/87.jpg',
      name: 'Keith Pearson',
      nameIndex: "K",
    ),
  ];
}
