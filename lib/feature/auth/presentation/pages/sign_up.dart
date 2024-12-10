import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/snackBar/snackbar.dart';
import '../../data/data_source/Data_source.dart';
import '../../data/repository_imp/repository_imp.dart';
import '../../domin/use_case/Sign_up_useCase.dart';
import '../manger/sign_up/Cubit.dart';
import '../manger/sign_up/states.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;

    var theme = Theme.of(context);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(
            SignUpUseCase(AuthRepositoryImpl(AuthRemoteDataSource(Dio())))),
        child: BlocConsumer<SignUpCubit, SignupState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sucessfuly create acount')));
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            var auth_cubit = BlocProvider.of<SignUpCubit>(context);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenheight * 0.05,
                  ),
                  Image.asset("assets/image/route.png"),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: screenheight * 0.01),
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text("Full-Name",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                            SizedBox(height: screenheight * 0.02),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                              controller: auth_cubit.nameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  filled: true,
                                  // Ensures the fillColor is applied
                                  fillColor: Colors.white,
                                  hintText: 'enter your full name',
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            SizedBox(height: screenheight * 0.05),
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text("Mobile-Number",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                            SizedBox(height: screenheight * 0.02),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                              controller: auth_cubit.phoneNumberController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  filled: true,
                                  // Ensures the fillColor is applied
                                  fillColor: Colors.white,
                                  hintText: 'enter your mobile number',
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            SizedBox(height: screenheight * 0.05),
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text("Email_Adress",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                            SizedBox(height: screenheight * 0.02),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              controller: auth_cubit.emailController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  filled: true,
                                  // Ensures the fillColor is applied
                                  fillColor: Colors.white,
                                  hintText: 'enter your email adresss',
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            SizedBox(height: screenheight * 0.05),
                            FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.scaleDown,
                                child: Text("Password",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                            SizedBox(height: screenheight * 0.02),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters long';
                                }
                                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                  return 'Password must include at least one uppercase letter';
                                }
                                if (!RegExp(r'[auth_cbit-z]')
                                    .hasMatch(value)) {
                                  return 'Password must include at least one lowercase letter';
                                }
                                if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  return 'Password must include at least one number';
                                }
                                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                    .hasMatch(value)) {
                                  return 'Password must include at least one special character';
                                }
                                return null; // Password is valid
                              },
                              obscureText: auth_cubit.visPassord,
                              controller: auth_cubit.passwordController,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        auth_cubit.togglePasswordVisibility();
                                      },
                                      icon: Icon(auth_cubit.visPassord
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_outlined)),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  filled: true,
                                  // Ensures the fillColor is applied
                                  fillColor: Colors.white,
                                  hintText: 'enter your password',
                                  errorStyle: const TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            SizedBox(height: screenheight * 0.05),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<SignUpCubit>(context)
                                        .signUp();
                                    MotionToastUtils.showSuccess(context,
                                        "Successful", "Successfully Create Acount");
                                    //  Navigator.pushReplacementNamed(context, RouteName.Sign_in);
                                  } else {}
                                },
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: const EdgeInsets.all(22)),
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text("sign up",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                                    color: theme.primaryColor,
                                                    fontWeight:
                                                        FontWeight.w600))))),
                            SizedBox(height: screenheight * 0.04),
                          ],
                        )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
