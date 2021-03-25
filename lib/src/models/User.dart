class User {
  int _id;
  String _name;
  String _lastName;
  String _phone;
  String _address;
  String _email;
  String _created;
  int _userId;
  String _token;

  User(this._name, this._email, this._token, this._userId, //params required
      [this._lastName,
      this._id,
      this._phone,
      this._address,
      this._created]); // params optionals

  User.forRegistration(this._token);

  @override
  String toString() {
    return "User #${this._userId}: ${this._name}";
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

  String getPhone() {
    return this._phone;
  }

  String getAddress() {
    return this._address;
  }

  String getEmail() {
    return this._email;
  }

  int getUserId() {
    return this._userId;
  }

  String getToken() {
    return this._token;
  }

  String getCreated() {
    return this._created;
  }

  void setId(int id) {
    this._id = id;
  }

  void setName(String name) {
    this._name = name;
  }

  void setLastName(String lastName) {
    this._lastName = lastName;
  }

  void setPhone(String phone) {
    this._phone = phone;
  }

  void setAddress(String address) {
    this._address = address;
  }

  void setEmail(String email) {
    this._email = email;
  }

  void setUserId(int userId) {
    this._userId = userId;
  }

  void setToken(String token) {
    this._token = token;
  }
}
