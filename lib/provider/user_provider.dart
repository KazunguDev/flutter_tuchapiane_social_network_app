import 'package:flutter/material.dart';
import 'package:flutter_tuchapiane_social_network_app/data/model/user.dart';
import 'package:flutter_tuchapiane_social_network_app/data/service/get_all_user_service.dart';

class UserProvider extends ChangeNotifier {
  Future<List<User>> getAllUser() async {
    return await GetAllUserService().call();
  }
}
