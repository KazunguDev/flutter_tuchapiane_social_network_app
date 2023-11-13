import 'dart:convert';

import 'package:flutter_tuchapiane_social_network_app/config/app_config.dart';
import 'package:flutter_tuchapiane_social_network_app/data/response/login_response.dart';
import 'package:flutter_tuchapiane_social_network_app/data/model/user.dart';
import 'package:flutter_tuchapiane_social_network_app/data/service/base_service.dart';
import 'package:http/http.dart' as http;

class LoginService extends ServiceBase<LoginResponse> {
  final String username;
  final String password;

  LoginService(this.username, this.password);
  Future<LoginResponse> call() async {
    final result = await http.post(Uri.parse('${AppConfig.baseUrl}/login'),
        body: jsonEncode({
          'username': username,
          'password': password,
        }));
    return LoginResponse.fromJson(jsonDecode(result.body)['data']);
  }
}
