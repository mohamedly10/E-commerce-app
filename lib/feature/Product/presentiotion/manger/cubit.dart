import 'package:dio/dio.dart';
import 'package:e_commerce_app/feature/Product/data/data_source/data_source.dart';
import 'package:e_commerce_app/feature/Product/data/model/Product.dart';
import 'package:e_commerce_app/feature/Product/data/repository_Imp/product_repository_imp.dart';
import 'package:e_commerce_app/feature/Product/domin/Use%20Case/Product%20Use_Case.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
   ProductDataSource productDataSource=ProductDataSource(Dio());
  late  ProductRepositoryImp productRepository=ProductRepositoryImp(productDataSource);
  late ProductUseCase productUseCase=ProductUseCase(productRepository);

  ProductCubit() :super(ProductInitial());
Future<void>fetchProduct(String subCategoryId) async{
  List<Product> fetchedProduct=[];
  emit(ProuctLoading());
  try{  
    fetchedProduct= await productUseCase.excute(subCategoryId);
    if(fetchedProduct.isEmpty){
      emit(ProductFailure("Empity Product"));
    }
    else{
      emit(ProductSuccessfuly(fetchedProduct));
    }
  }
  catch(e){
    emit(ProductFailure("have error when fetch prodect $e"));
  }


}
}