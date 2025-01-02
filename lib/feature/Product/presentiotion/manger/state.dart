import 'package:e_commerce_app/core/Failuers/Failuers.dart';
import 'package:e_commerce_app/feature/Product/data/model/Product.dart';

abstract class ProductState{}
class ProductInitial extends ProductState{}
class ProuctLoading extends ProductState{}
class ProductSuccessfuly extends ProductState{
 final List<Product> allProduct;
 ProductSuccessfuly(this.allProduct);
}
class ProductFailure extends ProductState{
 final String message;
 ProductFailure(this.message);
}
