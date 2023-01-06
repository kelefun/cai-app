class FoodCatalog {
   int? totalItem;
   int? pageIndex;
   int? pageSize;
   int? totalPage;
   List<Items>? items;

   FoodCatalog(
       {this.totalItem,
          this.pageIndex,
          this.pageSize,
          this.totalPage,
          this.items});

   FoodCatalog.fromJson(Map<String, dynamic> json) {
      totalItem = json['totalItem'];
      pageIndex = json['pageIndex'];
      pageSize = json['pageSize'];
      totalPage = json['totalPage'];
      if (json['items'] != null) {
         items = <Items>[];
         json['items'].forEach((v) {
            items!.add(Items.fromJson(v));
         });
      }
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['totalItem'] = this.totalItem;
      data['pageIndex'] = this.pageIndex;
      data['pageSize'] = this.pageSize;
      data['totalPage'] = this.totalPage;
      if (this.items != null) {
         data['items'] = this.items!.map((v) => v.toJson()).toList();
      }
      return data;
   }
}

class Items {
   int? id;
   String? foodName;
   String? foodIcon;
   String? foodCategory;

   Items(
       {this.id,
          this.foodName,
          this.foodIcon,
          this.foodCategory});

   Items.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      foodName = json['foodName'];
      foodIcon = json['foodIcon'];
      foodCategory = json['foodCategory'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['foodName'] = this.foodName;
      data['foodIcon'] = this.foodIcon;
      data['foodCategory'] = this.foodCategory;
      return data;
   }
}
