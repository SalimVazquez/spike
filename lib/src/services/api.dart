import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:spike/src/models/User.dart';

class API {
  final Dio _dio = Dio();
  final api = "http://your-ip:port/api";

  Future<void> register(
    BuildContext context, {
    @required String email,
    @required String password,
  }) async {
    try {
      final Response response = await this._dio.post(api + "/register",
          data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        User user = User(
            response.data['data']['id'],
            response.data['data']['email'],
            response.data['data']['password'],
            response.data['token'],
            response.data['data']['name'],
            response.data['data']['last_name'],
            response.data['data']['age'],
            null,
            response.data['data']['address']);
        Navigator.pushNamed(context, '/dashboard', arguments: user);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 400)
          print("Error en registro: " + e.response.toString());
        else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      print('Error:' + e.toString());
    }
  }

  Future<void> login(BuildContext context,
      {@required String email, @required String password}) async {
    try {
      final Response response = await this
          ._dio
          .post(api + "/login", data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        User user = User(
            response.data['data']['id'],
            response.data['data']['email'],
            response.data['data']['password'],
            response.data['token'],
            response.data['data']['name'],
            response.data['data']['last_name'],
            response.data['data']['age'],
            null,
            response.data['data']['address']);
        Navigator.pushNamed(context, '/dashboard', arguments: user);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 401)
          print("Credenciales incorrectas");
        else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      print('Error:' + e.toString());
    }
  }

  Future<void> update(BuildContext context,
      {@required int id,
      @required String name,
      @required String lastName,
      @required int age,
      @required String address,
      @required String email,
      String token}) async {
    try {
      final Response response = await this._dio.put(api + "/user-update/$id",
          data: {
            "id": id,
            "name": name,
            "last_name": lastName,
            "age": age,
            "address": address,
            "email": email
          },
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        User user = User(
            response.data['data']['id'],
            response.data['data']['email'],
            response.data['data']['password'],
            response.data['token'],
            response.data['data']['name'],
            response.data['data']['last_name'],
            response.data['data']['age'],
            null,
            response.data['data']['address']);
        Navigator.pushNamed(context, '/dashboard', arguments: user);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 401)
          print("Credenciales incorrectas");
        else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      print('Error:' + e.toString());
    }
  }
}
