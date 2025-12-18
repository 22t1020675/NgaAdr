import 'package:appp_hi/model/product.dart'; 
import 'package:dio/dio.dart';

class API {
  final Dio _dio = Dio();

  Future<List<Product>> getAllProduct() async {
    try {
      var response = await _dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((x) => Product.fromJson(x)).toList();
      } else {
        print('Lỗi kết nối: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Lỗi API: $e');
      return [];
    }
  }
}
var test_api = API();