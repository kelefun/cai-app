import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.index = 0,
    this.name='',
    this.imagePath = '',
    this.isSelected = false,
  });

  String imagePath;
  String name;
  bool isSelected;
  int index;

  //TODO animation 为何放在这？
  AnimationController? animationController;

  static List<TabIconData> tabIconsList = [
    TabIconData(
      index: 0,
      name:'首页',
      imagePath: 'assets/app/tab_1.png',
      isSelected: true,
    ),
    TabIconData(
      index: 1,
      name:'菜园',
      imagePath: 'assets/app/tab_2.png',
      isSelected: false,
    ),
    TabIconData(
      index: 2,
      name:'菜篮',
      imagePath: 'assets/app/tab_3.png',
      isSelected: false,
    ),
    TabIconData(
      index: 3,
      name:'我的',
      imagePath: 'assets/app/tab_4.png',
      isSelected: false,
    ),
  ];
}
