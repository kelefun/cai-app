import 'package:flutter/material.dart';

import 'package:caichacha/app_theme.dart';

class NoticeView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const NoticeView({Key? key, this.animationController, this.animation})
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
                  left: AppTheme.widgetSideSpace, right: AppTheme.widgetSideSpace,  bottom:AppTheme.widgetRunSpace),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          //背景大小
                          padding: const EdgeInsets.only(
                              left: 18, bottom: 6, right: 16, top: 6),
                          child: Text(
                            '多喝热水，多运动',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: AppTheme.subTitle,
                                letterSpacing: 0.0,
                                color: Theme.of(context).colorScheme.tertiary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -24,
                    // left: 16,
                    child: SizedBox(
                      width: 68,
                      height: 68,
                      child: Image.asset("assets/app/shui.png"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
