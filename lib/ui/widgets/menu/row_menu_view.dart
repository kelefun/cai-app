import 'package:caichacha/app_theme.dart';
import 'package:caichacha/model/menu_row_data.dart';
import 'package:flutter/material.dart';


class RowMenu extends StatelessWidget {
 const RowMenu({
    Key? key,
    this.backgroundColor,
    required this.futureList,
  }) : super(key: key);
  final Color? backgroundColor;
  final Future<List<MenuData>> futureList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuData>>(
      future: futureList,
      builder: (context, snapshot) {
        return _ItemShape(
          backgroundColor: backgroundColor,
          menuList: snapshot.hasData ? snapshot.data! : [],
        );
      },
    );
  }
}

class _ItemShape extends StatelessWidget {
  const _ItemShape({
    Key? key,
    this.backgroundColor,
    required this.menuList,
  }) : super(key: key);
  final Color? backgroundColor;
  final List<MenuData> menuList;

  @override
  Widget build(BuildContext context) {
    if(menuList.isEmpty){
      return const SizedBox();
    }
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      width: double.infinity,
      height: 42,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: menuList.length ,
        itemBuilder: (context, index) {
          return  GestureDetector(
            onTap: () {
             print('哈哈');
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              margin: const EdgeInsets.only(left: AppTheme.widgetSideSpace, top: 5, bottom: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: backgroundColor??Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                menuList[index].txt,
                style:  TextStyle(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
