import 'package:e_commerce_app/core/Failuers/Failuers.dart';
import 'package:e_commerce_app/feature/Product/data/model/Product.dart';
import 'package:e_commerce_app/feature/Product/data/model/ProductDetails.dart';

abstract class ProductDetailsState{}
class ProductDetailsInitial extends ProductDetailsState{}
class ProductDetailsLoading extends ProductDetailsState{}
class ProductDetailsSuccessfuly extends ProductDetailsState{
  final ProductInfo productInfo;
  ProductDetailsSuccessfuly(this.productInfo);
}

class ProductDetailsFailure extends ProductDetailsState{
  final String message;
  ProductDetailsFailure(this.message);
}
