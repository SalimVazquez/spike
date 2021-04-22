import 'package:flutter/material.dart';
import 'package:spike/src/models/User.dart';
import 'package:spike/src/services/api.dart';

class FormUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    var _name = TextEditingController();
    var _lastName = TextEditingController();
    var _phone = TextEditingController();
    var _address = TextEditingController();
    var _email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario',
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
                'Nombre de usuario',
                style: TextStyle(color: Colors.white),
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
              title: Text('Users'),
              leading: Icon(
                Icons.people_alt,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/list');
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
              margin: EdgeInsets.only(top: 350),
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
                            'Personal Form',
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
                            controller: _phone,
                            decoration: InputDecoration(labelText: 'Phone'),
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
                              onPressed: () {},
                              textColor: Colors.white,
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 18),
                              ),
                              color: Color.fromRGBO(38, 193, 101, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
