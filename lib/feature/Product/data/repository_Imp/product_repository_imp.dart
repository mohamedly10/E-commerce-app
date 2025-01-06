

import '../../domin/repository/Product repository.dart';
import '../data_source/data_source.dart';
import '../model/Product.dart';
import '../model/ProductDetails.dart';

class ProductRepositoryImp implements ProductRepository {
  late ProductDataSource productDataSource;
  ProductRepositoryImp(this.productDataSource);


  @override
  Future<List<Product>> getProducts(String subCategoryId) {
return productDataSource.fetchProductsByCategory(subCategoryId);

  }

  @override
  Future<ProductInfo> getProductsDetails(String productId) {

  return productDataSource.fetchProductDetails(productId);
  }






}