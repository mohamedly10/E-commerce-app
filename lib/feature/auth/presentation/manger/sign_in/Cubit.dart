
import 'package:e_commerce_app/feature/auth/presentation/manger/sign_in/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/use_case/Sign_in_use_case.dart';

class SignInCubit extends Cubit<SignInState>{
  var emailController =   TextEditingController ();
  var passwordController = TextEditingController();
  bool visPassord=false;
final SignInUseCase signInUseCase;

  SignInCubit(this.signInUseCase): super(AuthInitial());


Future<bool> signin() async {
  emit(AuthLoading()); // تغيير الحالة إلى تحميل

  final result = await signInUseCase.execute(emailController.text, passwordController.text);


  return result.fold(
        (failure) {
      emit(AuthFailure(failure.message)); // في حالة الفشل
      return Future.value(false); // إرجاع false
    },
        (successfully) {
      emit(AuthSuccess()); // في حالة النجاح
      return Future.value(true);; // إرجاع true
    },
  );
}
  void togglePasswordVisibility() {
    visPassord =!visPassord;
    emit(PasswordState());
  }

}