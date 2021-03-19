class User {
  int _id;
  String _name;
  String _lastName;
  int _age;
  String _avatar;
  String _address;
  String _email;
  String _password;
  String _token;

  User(this._id, this._email, this._password, this._token,
      [this._name, this._lastName, this._age, this._avatar, this._address]);

  @override
  String toString() {
    return "User #${this._id}: ${this._email} -> ${this._token}";
  }

  int getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  String getLastName() {
    return this._lastName;
  }

  int getAge() {
    return this._age;
  }

  String getAddress() {
    return this._address;
  }

  String getAvatar() {
    return this._avatar;
  }

  String getEmail() {
    return this._email;
  }

  String getToken() {
    return this._token;
  }
}
