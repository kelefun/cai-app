import 'package:caichacha/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:caichacha/model/swiper_data.dart';

class SwiperView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const SwiperView({Key? key, this.animationController, this.animation})
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
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.76,
                    height: 140,
                    enlargeCenterPage: true),
                items: SwiperData.dataList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          // to show image
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(AppTheme.radius)),
                              image: DecorationImage(
                                  image: AssetImage(i.imagePath),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(AppTheme.radius)),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withOpacity(0.6),
                                ),
                                child: Text(i.txt,
                                    style: TextStyle(
                                        fontSize: AppTheme.subTitle,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                    maxLines: 1,
                                )),
                          ));
                    },
                  );
                }).toList(),
              )),
        );
      },
    );
  }
}
