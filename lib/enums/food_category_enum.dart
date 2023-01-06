enum FoodCategory {
  vegetable(
    card: 0,
    imagePath: 'assets/home/food_cai.png',
    menuText: "蔬菜",
  ),
  fruit(
    card: 0,
    imagePath: 'assets/home/food_cheng.png',
    menuText: "水果",
  ),
  meat(
    card: 0,
    imagePath: 'assets/home/food_rou.png',
    menuText: "肉类",
  ),
  aquatic(
    card: 0,
    imagePath: 'assets/home/food_xia.png',
    menuText: "水产",
  ),
  staple(
    card: 0,
    imagePath: 'assets/home/food_fan.png',
    menuText: "主食",
  ),
  egg(
    card: 0,
    imagePath: 'assets/home/food_dan.png',
    menuText: "蛋奶",
  ),
  nut(
    card: 0,
    imagePath: 'assets/home/food_ye.png',
    menuText: "坚果",
  ),
  foodOther(
    card: 0,
    imagePath: 'assets/home/food_you.png',
    menuText: "其它",
  ),
  purine(
    card: 1,
    imagePath: 'assets/home/icon_tong.png',
    menuText: "嘌呤",
  ),
  glucose(
    card: 1,
    imagePath: 'assets/home/icon_tang.png',
    menuText: "血糖",
  ),
  pressure(
    card: 1,
    imagePath: 'assets/home/icon_ya.png',
    menuText: "血压",
  ),
  energy(
    card: 1,
    imagePath: 'assets/home/icon_nai.png',
    menuText: "热量",
  ),
  fat(
    card: 1,
    imagePath: 'assets/home/icon_yao.png',
    menuText: "减脂",
  ),
  baby(
    card: 1,
    imagePath: 'assets/home/icon_bao.png',
    menuText: "宝宝",
  ),
  pregnant(
    card: 1,
    imagePath: 'assets/home/icon_nv.png',
    menuText: "孕妇",
  ),
  categoryOther(
    card: 1,
    imagePath: 'assets/home/icon_cha.png',
    menuText: "其它",
  );

  const FoodCategory({
    required this.card,
    required this.menuText,
    required this.imagePath,
  });

  //展示区域,0-菜菜，1-查查
  final int card;
  final String menuText;
  final String imagePath;
}
