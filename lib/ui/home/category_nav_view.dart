import 'package:caichacha/enums/food_category_enum.dart';
import 'package:flutter/material.dart';

import 'package:caichacha/app_theme.dart';
import 'package:go_router/go_router.dart';

class CategoryNavView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const CategoryNavView({Key? key, this.animationController, this.animation})
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
                    padding: const EdgeInsets.all(AppTheme.widgetSideSpace),
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
                              // spreadRadius: 2,
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
                                    Text('查查',
                                        style: TextStyle(
                                            fontSize: AppTheme.title,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.5,
                                  height: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                //菜单导航
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 20,
                                  // runAlignment: WrapAlignment.spaceAround,
                                  children: buildCategoryNavWidget(context),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )));
        });
  }
}

List<Widget> buildCategoryNavWidget(BuildContext context) {
  List<Widget> widgetList = FoodCategory.values
      .where((e) => e.card == 1)
      .map((e) => InkWell(
            onTap: () => {context.push('/food_list/${e.index}')},
            child: SizedBox(
              width: 64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    e.imagePath,
                    width: 34,
                    height: 34,
                  ),
                  Text(
                    e.menuText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();
  return widgetList;
}
