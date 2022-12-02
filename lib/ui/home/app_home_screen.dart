import 'package:caichacha/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:caichacha/ui/home/food_nav_view.dart';
import 'package:caichacha/ui/home/category_nav_view.dart';
import 'package:caichacha/ui/home/notice_view.dart';
import 'package:caichacha/ui/home/swiper_view.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;

  @override
  State createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  //TODO count 尝试下回调？
  List<Widget> addAllListData() {
    const int count = 4;
    return [
      NoticeView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: const Interval((1 / count) * 0, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!),
      SwiperView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 1, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
      FoodNavView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 2, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
      // RowMenu(
      //   futureList: MenuData.menuList(),
      // ),
      CategoryNavView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 3, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      )
    ];
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Theme.of(context).colorScheme.primaryContainer ));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: <Widget>[
          getMainListViewUI(),
          getAppBarUI(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }

  Widget getMainListViewUI() {
    List<Widget> listViews = addAllListData();

    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 64 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  //TODO EXTRACT APP BAR
  Widget getAppBarUI() {
    const double iconSize = 38;
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(AppTheme.radius),
                        bottomRight: Radius.circular(AppTheme.radius)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(topBarOpacity),
                          offset: Offset(1.5, 1.0),
                          blurRadius: 15.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      //留出状态栏空间
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 6 - 4.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "菜查查",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        AppTheme.title + 6 - 6 * topBarOpacity,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: iconSize,
                              width: iconSize,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  semanticLabel: 'search',
                                ),
                                onPressed: () {
                                  print('search button');
                                },
                              ),
                            ),
                            SizedBox(
                              height: iconSize,
                              width: iconSize,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.notifications_none,
                                  semanticLabel: 'notification',
                                ),
                                onPressed: () {
                                  print('notification button');
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
