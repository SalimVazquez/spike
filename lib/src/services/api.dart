import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:spike/src/models/User.dart';

class API {
  final Dio _dio = Dio();
  final api = "http://34.239.109.204/api/v1";

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
        if (e.response.statusCode == 400) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "ERROR",
            desc: "Error de registro, verifique sus datos",
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          print("Error en registro: " + e.response.toString());
        } else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      Alert(
        context: context,
        type: AlertType.error,
        title: "ERROR",
        desc: "Error de registro, verifique sus datos",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      print('Error register:' + e.toString());
    }
  }

  Future<void> login(BuildContext context,
      {@required String username, @required String password}) async {
    try {
      final Response response = await this._dio.post(api + "/login/",
          data: {"username": username, "password": password});
      if (response.statusCode == 200)
        profile(context,
            userId: response.data['user_id'].toString(),
            token: response.data['token']);
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 400) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "ERROR",
            desc: "Credenciales incorrectas, revise sus datos",
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          print("Credenciales incorrectas");
        } else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      Alert(
        context: context,
        type: AlertType.error,
        title: "ERROR",
        desc: "Credenciales incorrectas, revise sus datos",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      // print('Error login:' + e.toString());
    }
  }

  Future<void> profile(BuildContext context,
      {@required userId, @required token}) async {
    try {
      final Response response = await this._dio.get(
          api + "/profile/profile_detail/$userId",
          options: Options(headers: {
            "Authorization": "Token $token",
            "Content-type": "application/json"
          }));
      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);
        user.setToken(token);
        Navigator.pushNamed(context, '/list', arguments: user);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response.statusCode == 404) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "ERROR",
            desc: "Sin usuarios registrados",
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          print("User not found");
        } else {
          print('Error status code ' + e.response.statusCode.toString());
          print('Error server response ' + e.response.data.toString());
        }
      }
      print('Error profile:' + e.toString());
    }
  }

  // Future<void> update(BuildContext context,
  //     {@required Map<String, dynamic> params}) async {
  //   try {
  //     final Response response = await this._dio.put(
  //         api + "/profile/profile_detail/${params['user']}/",
  //         data: {
  //           "name": params['name'],
  //           "lastName": params['lastName'],
  //           "phone": params['phone'],
  //           "address": params['address'],
  //           "email": params['email'],
  //           "user": params['user']
  //         },
  //         options: Options(headers: {
  //           "Authorization": "Token ${params['token']}",
  //           "Content-type": "application/json"
  //         }));
  //     if (response.statusCode == 200) {
  //       User user = User.fromJson(response.data[0]);
  //       Navigator.pushNamed(context, '/dashboard', arguments: user);
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       if (e.response.statusCode == 400)
  //         print("Bad Request ${e.response.data}");
  //       else {
  //         print('Error status code ' + e.response.statusCode.toString());
  //         print('Error server response ' + e.response.data.toString());
  //         print('Error server response message' +
  //             e.response.statusMessage.toString());
  //       }
  //     }
  //     print('Error update:' + e.toString());
  //   }
  // }
}
