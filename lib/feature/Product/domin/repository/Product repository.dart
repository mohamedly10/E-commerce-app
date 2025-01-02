import 'package:e_commerce_app/feature/Product/data/model/Product.dart';
abstract class ProductRepository{
Future <List<Product>> getProducts(String subCategoryId);
}