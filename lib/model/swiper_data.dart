class SwiperData {
  SwiperData({
    this.imagePath = '',
    this.txt = '',
  });

  String imagePath;
  String txt;

  static List<SwiperData> dataList = [
    SwiperData(
      imagePath: 'assets/home/swiper_3.png',
      txt: "菜叶",
    ), SwiperData(
      imagePath: 'assets/home/swiper_2.png',
      txt: "调味料知多少",
    ), SwiperData(
      imagePath: 'assets/home/swiper_1.png',
      txt: "洋葱",
    ),
  ];
}
