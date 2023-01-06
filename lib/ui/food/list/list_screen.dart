import 'package:caichacha/api/api_food.dart';
import 'package:caichacha/app_theme.dart';
import 'package:caichacha/enums/food_category_enum.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.idx}) : super(key: key);
  final int idx;

  @override
  State<ListScreen> createState() => _ListState();
}

class _ListState extends State<ListScreen> {
  late int _idx;

  @override
  void initState() {
    super.initState();
    _idx = widget.idx;
  }

  @override
  Widget build(BuildContext context) {
    FoodCategory n = FoodCategory.values[_idx];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        title: const Text('列表'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Row(children: [
        Container(
            color:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
            child: Column(
                children: FoodCategory.values
                    .where((element) => element.card == n.card)
                    .map<Widget>((e) => InkWell(
                    //左侧菜单点击
                    onTap: () => {
                      setState(() => {_idx = e.index}),
                      ApiFood().getFoodCatalog(e.name)
                    },
                        child: Container(
                            height: 56,
                            width: 68,
                            color: e.index == _idx
                                ? Theme.of(context).colorScheme.background
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                e.menuText,
                                style: TextStyle(
                                    fontSize: AppTheme.subTitle,
                                    color: e.index == _idx
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onBackground),
                              ),
                            ))))
                    .toList())),
        Column(
          children: [
            //TODO 顶部按钮或文案展示区域

            //数据展示列表
          ],
        ),
      ]),
    );
  }
}
