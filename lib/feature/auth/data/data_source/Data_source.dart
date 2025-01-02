
import 'package:dio/dio.dart';
import 'package:e_commerce_app/feature/auth/domin/Entity/User.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<UserInfo> signup(
       UserInfo userinfo
  ) async {
    try {
      final response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signup',
        data: {
          'name': userinfo.name,
          'email': userinfo.email,
          'password': userinfo.password,
          'rePassword': userinfo.password,
          'phone': userinfo.phoneNumber,
        },
       // options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 201) {
        print('Success: ${response.data}');
var data_from_api= UserInfo(name: userinfo.name, email: userinfo.email, phoneNumber: userinfo.phoneNumber, password: userinfo.password,token:response.data['token'] );
        return data_from_api;
      } else {
        print('Error: ${response.data}');
        throw Exception('Failed to sign up. Server responded with: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with a non-200 status code
        print('Dio Error: ${e.response?.data}');
        throw Exception('Signup failed: ${e.response?.data}');
      } else {
        // No response received (e.g., network error)
        print('Dio Error: ${e.message}');
        throw Exception('Signup failed: ${e.message}');
      }
    } catch (e) {
      // Other unexpected errors
      print('Unexpected Error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }
  Future<bool> signin(String email, String password) async {
    try {
      final response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signin',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Success: ${response.data}');
        return true;
      } else {
        print('Error: ${response.data}');
        throw Exception('Failed to sign in. Server responded with: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio Error: ${e.response?.data}');
        throw Exception(e.response?.data['message'] ?? 'Unknown error');
      } else {
        print('Dio Error: ${e.message}');
        throw Exception(e.message);
      }
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception('Unexpected error occurred: $e');
    }
  }

}
