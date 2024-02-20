import 'package:edulang/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

// Interface
abstract class ILogin {
  Future<UserModel?> login(String email, String password);
  Future<UserModel?> getUser();
  Future<bool> logout();
}

// Implementasi service yang menggunakan interface ILogin
class LoginService implements ILogin {
  @override
  Future<UserModel?> login(String email, String password) async {
    final api = 'https://reqres.in/api/login';
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;

    try {
      response = await dio.post(api, data: data);

      if (response.statusCode == 200) {
        final body = response.data;
        SharedPreferences storage = await SharedPreferences.getInstance();
        await storage.setString('TOKEN', body['token']);
        await storage.setString('EMAIL', email);
        return UserModel(email: email, token: body['token']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(email: email, token: token);
    } else {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final email = storage.getString('EMAIL');
    final token = storage.getString('TOKEN');
    if (email != null && token != null) {
      await storage.remove('TOKEN');
      await storage.remove('EMAIL');
      return true;
    } else {
      return false;
    }
  }
}
