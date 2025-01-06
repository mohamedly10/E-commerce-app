import 'package:dio/dio.dart';
import 'package:e_commerce_app/feature/Product/data/data_source/data_source.dart';
import 'package:e_commerce_app/feature/Product/data/model/ProductDetails.dart';
import 'package:e_commerce_app/feature/Product/data/repository_Imp/product_repository_imp.dart';
import 'package:e_commerce_app/feature/Product/domin/Use%20Case/product_Details/Product_Details.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/productDetails/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState>{
  final ProductDataSource productDataSource=ProductDataSource(Dio());
 late ProductRepositoryImp productRepository =ProductRepositoryImp(productDataSource);
late  ProductDetailsUseCase productDetailsUseCase=ProductDetailsUseCase(productRepository);
  ProductDetailsCubit():super(ProductDetailsInitial());
  Future<void>feetchProdutDetails(String productId) async{
    ProductInfo? productInfo;
    emit(ProductDetailsLoading());
    try {
      productInfo = await productDetailsUseCase.excute(productId);
      if(productInfo==null){
        emit(ProductDetailsFailure("empity"));
      }else{
        emit(ProductDetailsSuccessfuly(productInfo));
      }
    }
    catch(e){
      emit(ProductDetailsFailure("have error when fetch prodect $e"));
    }


  }
}