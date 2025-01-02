import 'package:e_commerce_app/core/Layout/manger/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState>{

  NavigationCubit():super(NavigationInitaial());



  void setIndex(int index) {
    emit(NavigationSwap(currentIndex: index));
  }
}