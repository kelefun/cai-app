import 'package:caichacha/app_theme.dart';
import 'package:caichacha/model/tab_icon_data.dart';
import 'package:caichacha/ui/widgets/bottom/bottom_bar_view.dart';
import 'package:caichacha/ui/home/app_home_screen.dart';
import 'package:caichacha/ui/explore/app_explore_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({super.key});

  @override
  State createState() => _AppStartScreenState();
}
//TODO color filter  大事件 app整体灰色
class _AppStartScreenState extends State<AppStartScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  //再按一次退出程序，间隔时间
  static Duration exitInfoDuration = const Duration(milliseconds: 1500);
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container();

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = AppHomeScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //设置状态栏和底部导航栏 icon颜色 （这个brightness总感觉打开方式不对，有时间再看看
    Brightness myBrightness =
        Theme.of(context).colorScheme.brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: myBrightness,
      statusBarBrightness: myBrightness,
      systemNavigationBarColor: Theme.of(context).colorScheme.background,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: myBrightness,
    ));
    final exitSnackBar = SnackBar(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        duration: exitInfoDuration,
        content: Text(
          '再按一次退出菜查查',
          style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: AppTheme.subTitle),
        ));
    //此处赋值没啥意义，只是为了初始化值
    DateTime lastPopTime = DateTime.fromMicrosecondsSinceEpoch(0);
    return WillPopScope(
        onWillPop: () async {
          //如果不是在首页，则返回首页
          if (!tabIconsList[0].isSelected) {
            setState(() {
              tabBody = AppHomeScreen(animationController: animationController);
              for (var tab in tabIconsList) {
                tab.isSelected=tab.index == 0;
              }
            });
            return false;
          }
          //如果在首页则连按两次退出
          if (DateTime.now().difference(lastPopTime) > exitInfoDuration) {
            lastPopTime = DateTime.now();

            ScaffoldMessenger.of(context).showSnackBar(exitSnackBar);
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          // backgroundColor: Colors.transparent,
          body: FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Stack(
                  children: <Widget>[
                    tabBody,
                    bottomBar(),
                  ],
                );
              }
            },
          ),
        ));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      AppHomeScreen(animationController: animationController);
                });
              });
            } else if (index == 1 || index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = AppExploreScreen(
                      animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
