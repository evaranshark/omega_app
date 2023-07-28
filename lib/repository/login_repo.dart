import 'package:dio/dio.dart';

final class LoginRepository {
  static const String _host = "158.160.14.209";
  static const String _loginPath = "/api/v1/auth/login";

  final Uri _loginUri;

  final dio = Dio();

  LoginRepository._()
      : _loginUri = Uri(
          scheme: "http",
          host: _host,
          path: _loginPath,
        );

  factory LoginRepository() => LoginRepository._();

  /// For test example returns [bool] (whether logged successfully or not)
  Future<bool> login(LoginData data) async {
    var response = await dio.postUri(_loginUri, data: {
      'login': data.email,
      'password': data.password,
    }, options: Options(
      validateStatus: (status) {
        return status != null && status < 500;
      },
    ));
    if (response.statusCode == 200) {
      //Here we can save tokens
      return true;
    }
    return false;
  }
}

class LoginData {
  final String email, password;

  LoginData(this.email, this.password);
}
