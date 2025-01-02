import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constant/constan_app.dart';
import '../model/Category_model.dart';
import '../model/SubCategory_model.dart';

class CategoryDataSource {
  final Dio dio;
  CategoryDataSource({required this.dio});
  Future<List<Category>> getCategory() async {
    try {
      final response = await dio.get("https://ecommerce.routemisr.com/api/v1/categories");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

        // Convert JSON to List<Category>
        final categories = data.map((item) => Category.fromJson(item)).toList();

        return categories; // Now returning a Future<List<Category>>
      } else {
        throw Exception('Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      throw Exception('Error fetching categories');
    }
  }
  Future<List<SubCategory>> getubCategory(String categoryId) async {
    try {
      final response = await dio.get("${ConstantApp.domin}subcategories/?category=${categoryId}");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

        // Convert JSON to List<Category>
        final subCategory = data.map((item) => SubCategory.fromjson(item)).toList();


        return subCategory; // Now returning a Future<List<Category>>
      } else {
        throw Exception('Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching subcategories: $e');
      throw Exception('Error fetching categories');
    }
  }


}
