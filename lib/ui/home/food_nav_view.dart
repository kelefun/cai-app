import 'package:caichacha/enums/food_category_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:caichacha/app_theme.dart';

class FoodNavView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const FoodNavView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation!,
              child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation!.value), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppTheme.widgetSideSpace,
                        right: AppTheme.widgetSideSpace,
                        top: AppTheme.widgetRunSpace),
                    child: Container(
                      //卡片背景
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppTheme.radius)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .shadow
                                  .withOpacity(0.05),
                              spreadRadius: 0,
                              blurRadius: 10.0),
                        ],
                      ),
                      //卡片内容
                      child: SizedBox(
                        height: 240,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppTheme.cardPadding,
                                right: AppTheme.cardPadding,
                                top: AppTheme.cardPadding),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //card 名称
                                Row(
                                  children: [
                                    const SizedBox(width: 12),
                                    Text('菜菜',
                                        style: TextStyle(
                                            fontSize: AppTheme.title,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                  ],
                                ),
                                //divider
                                Divider(
                                  thickness: 1.5,
                                  height: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                //菜单导航
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  // runAlignment: WrapAlignment.spaceAround,
                                  children: buildFoodNavWidget(context),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )));
        });
  }
}

List<Widget> buildFoodNavWidget(BuildContext context) {
  List<Widget> widgetList = FoodCategory.values
      .where((element) => element.card == 0)
      .map((e) => InkWell(
          onTap: () => {context.push('/food_list/${e.index}')},
          child: SizedBox(
            width: 64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(e.imagePath),
                Transform(
                  transform: Matrix4.translationValues(0, -12, 0),
                  child: Text(
                    e.menuText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )))
      .toList();

  // widgetList.insert(
  //     3,
  //     const Divider(
  //       height: 20,
  //       thickness: 5,
  //       indent: 20,
  //       endIndent: 0,
  //       color: Colors.black,
  //     ));
  return widgetList;
}
