import 'package:dio/dio.dart';
import 'package:e_commerce_app/feature/Product/data/model/Product.dart';

import '../../../../core/constant/constan_app.dart';

class ProductDataSource {
  final Dio dio;
  ProductDataSource(this.dio);

  Future<List<Product>> fetchProductsByCategory(String subCategoryId) async {
    try {
      final response = await dio.get(
        "${ConstantApp.domin}products?category=$subCategoryId",
      );

      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('Success: ${response.data}');
        final List<dynamic>? data = response.data['data'];

        final List<Product> products = data!.map((product) => Product.fromJson(product)).toList();
        return products;

      } else {
        print('Error: ${response.data}');
        throw Exception('Failed to fetch products. Server responded with: ${response.data}');
      }
    }
    on DioException catch (e) {
      if (e.response != null) {
        print('Dio Error: ${e.response?.data}');
        throw Exception('Failed to fetch products: ${e.response?.data}');
      } else {
        print('Dio Error: ${e.message}');
        throw Exception('Failed to fetch products: ${e.message}');
      }
    }
    catch (e) {
      print('Unexpected Error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }
}
