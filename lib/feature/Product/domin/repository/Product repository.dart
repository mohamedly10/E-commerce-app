import 'package:e_commerce_app/feature/Product/data/model/Product.dart';
import 'package:e_commerce_app/feature/Product/data/model/ProductDetails.dart';
abstract class ProductRepository{
Future <List<Product>> getProducts(String subCategoryId);
Future <ProductInfo> getProductsDetails(String productId);
}