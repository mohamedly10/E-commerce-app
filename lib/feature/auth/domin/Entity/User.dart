class UserInfo {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  late String? token;

  UserInfo({required this.name, required this.email, required this.phoneNumber, required this.password , this.token});
}
