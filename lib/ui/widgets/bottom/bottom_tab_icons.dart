import 'package:flutter/material.dart';

import 'package:caichacha/app_theme.dart';
import 'package:caichacha/model/tab_icon_data.dart';

class TabIcons extends StatefulWidget {
  const TabIcons({Key? key, this.tabIconData, this.removeAllSelect})
      : super(key: key);

  final TabIconData? tabIconData;
  final Function()? removeAllSelect;

  @override
  State<TabIcons> createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData?.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.removeAllSelect!();
          widget.tabIconData?.animationController?.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData?.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    // final primaryColor = Theme.of(context).colorScheme.primary;

    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              if (!widget.tabIconData!.isSelected) {
                setAnimation();
              }
            },
            child: IgnorePointer(
              child: Column(
                children: [
                  ScaleTransition(
                      alignment: Alignment.center,
                      scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                          CurvedAnimation(
                              parent: widget.tabIconData!.animationController!,
                              curve: const Interval(0.1, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            // fit:BoxFit.fitHeight,
                            image: AssetImage(widget.tabIconData!.imagePath),
                          ),
                          // shape: BoxShape.circle,
                        ),
                        child: widget.tabIconData!.isSelected
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                      // color: primaryColor.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppTheme.accentColor,
                                            // offset: const Offset(0, 0),
                                            blurRadius: 10,
                                            spreadRadius: 6)
                                      ]),
                                ),
                              )
                            : Container(),
                      )),
                  Text(widget.tabIconData!.name,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontSize: 14, fontWeight: FontWeight.w400))
                ],
              ),
            )),
      ),
    );
  }
}
