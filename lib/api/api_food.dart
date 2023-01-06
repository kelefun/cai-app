import 'package:caichacha/api/dio_manager.dart';
import 'package:dio/dio.dart';

class ApiFood{
  void  getFoodCatalog(String category) async {
    Response response = await DioManager.instance.dio().get('/food_catalog/list', queryParameters: {'foodCategory': category});
    print(response.data.toString());
  }
}