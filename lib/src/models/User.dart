import 'package:flutter/cupertino.dart';

class User {
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String address;
  final String email;
  final int userId;
  String token;

  User(
      {@required this.id,
      @required this.name,
      @required this.lastName,
      @required this.phone,
      @required this.address,
      @required this.email,
      @required this.token,
      @required this.userId});

  @override
  String toString() {
    return "User #${this.userId}: ${this.name}";
  }

  int getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  String getLastName() {
    return this.lastName;
  }

  String getPhone() {
    return this.phone;
  }

  String getAddress() {
    return this.address;
  }

  String getEmail() {
    return this.email;
  }

  int getUserId() {
    return this.userId;
  }

  String getToken() {
    return this.token;
  }

  void setToken(String token) {
    this.token = token;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        lastName: json['lastName'],
        phone: json['phone'],
        address: json['address'],
        name: json['name'],
        email: json['email'],
        token: json['token'],
        userId: json['user_id']);
  }
}
