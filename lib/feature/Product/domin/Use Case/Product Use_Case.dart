import 'package:e_commerce_app/feature/Product/data/model/Product.dart';

import '../repository/Product repository.dart';

class ProductUseCase{
  late ProductRepository productRepository;
ProductUseCase(this.productRepository);
 Future<List<Product>>excute(String SubCategoryId){
   return productRepository.getProducts(SubCategoryId);
 }
}