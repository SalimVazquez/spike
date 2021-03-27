import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:spike/src/models/User.dart';

class API {
  final Dio _dio = Dio();
  final api = "http://ip-server/api/v1";

  Future<void> register(
    BuildContext context, {
    @required String username,
    @required String password,
  }) async {
    try {
      final Response response = await this._dio.post(api + "/registration/",
          data: {
            "username": username,
            "password1": password,
            "password2": password
          });
      if (response.statusCode == 201)
        login(context, username: username, password: password);
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
      {@required String username, @required String password}) async {
    try {
      final Response response = await this._dio.post(api + "/login/",
          data: {"username": username, "password": password});
      if (response.statusCode == 200) {
        User user = User(response.data['name'], response.data['email'],
            response.data['token'], response.data['user_id']);
        profile(context, user: user);
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

  Future<void> profile(BuildContext context, {@required User user}) async {
    try {
      final Response response = await this._dio.get(
          api + "/profile/profile_detail/${user.getUserId()}",
          options:
              Options(headers: {"Authorization": "Token ${user.getToken()}"}));
      if (response.statusCode == 200) {
        user.setId(int.parse(response.data['id']));
        user.setName(response.data['name']);
        user.setLastName(response.data['lastName']);
        user.setPhone(response.data['phone']);
        user.setAddress(response.data['address']);
        user.setEmail(response.data['email']);
        user.setUserId(int.parse(response.data['user']));
        Navigator.pushNamed(context, '/dashboard', arguments: user);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 404)
          print("User not found");
        else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      print('Error:' + e.toString());
    }
  }

  Future<void> update(BuildContext context,
      {@required Map<String, dynamic> params, @required User user}) async {
    try {
      final Response response = await this._dio.put(
          api + "/profile/profile_detail/${params['user']}/",
          data: {
            "name": params['name'],
            "lastName": params['lastName'],
            "phone": params['phone'],
            "address": params['address'],
            "email": params['email'],
            "user": params['user']
          },
          options:
              Options(headers: {"Authorization": "Token ${params['token']}"}));
      if (response.statusCode == 200) {
        user.setName(response.data['name']);
        user.setLastName(response.data['lastName']);
        user.setPhone(response.data['phone']);
        user.setAddress(response.data['address']);
        user.setEmail(response.data['email']);
        user.setUserId(response.data['id']);
        Navigator.pushNamed(context, '/dashboard', arguments: user);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 400)
          print("Bad Request ${e.response.data}");
        else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
          print('Error server response message' +
              e.response.statusMessage.toString());
        }
      }
      print('Error:' + e.toString());
    }
  }
}
