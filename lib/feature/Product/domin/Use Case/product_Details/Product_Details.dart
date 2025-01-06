import 'package:e_commerce_app/feature/Product/data/model/ProductDetails.dart';

import '../../repository/Product repository.dart';

class ProductDetailsUseCase{
  late ProductRepository productRepository;
  ProductDetailsUseCase(this.productRepository);

  Future<ProductInfo>excute(String productId){
    return  productRepository.getProductsDetails(productId);
  }
}