import 'package:flutter/material.dart';
import 'package:spike/src/models/User.dart';
import 'package:spike/src/services/api.dart';

class Update extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    var _name = TextEditingController();
    _name.text = user.getName();
    var _lastName = TextEditingController();
    _lastName.text = user.getLastName();
    var _phone = TextEditingController();
    _phone.text = user.getPhone().toString();
    var _address = TextEditingController();
    _address.text = user.getAddress();
    var _email = TextEditingController();
    _email.text = user.getEmail();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Admin',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                'admin@example.com',
                style: TextStyle(color: Color.fromRGBO(240, 240, 240, 1)),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/userProfile.png'),
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 400),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(20.0),
              child: Image.asset('assets/images/logoSpike.png'),
              height: 80.0,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(color: Color.fromRGBO(38, 193, 101, 1)),
                flex: 1,
              ),
              Expanded(
                child: Container(color: Colors.transparent),
                flex: 5,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  title: Center(
                    child: Text(
                      'Hi, Admin!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(15),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 20.0, top: 15, bottom: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Edit my profile',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Divider(),
                        CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('assets/images/userProfile.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            controller: _name,
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _lastName,
                            decoration: InputDecoration(labelText: 'Last Name'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _address,
                            decoration: InputDecoration(labelText: 'Address'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _phone,
                            decoration: InputDecoration(labelText: 'Phone'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(labelText: 'Email'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 50,
                            width: 400,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              onPressed: () {
                                API api = new API();
                                api.update(context,
                                    id: user.getId(),
                                    name: _name.text,
                                    lastName: _lastName.text,
                                    age: int.parse(_phone.text),
                                    address: _address.text,
                                    email: _email.text,
                                    token: user.getToken());
                              },
                              textColor: Colors.white,
                              child: Text(
                                'Update my profile',
                                style: TextStyle(fontSize: 18),
                              ),
                              color: Color.fromRGBO(38, 193, 101, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
