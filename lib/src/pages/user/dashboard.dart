import 'package:flutter/material.dart';
import 'package:spike/src/models/User.dart';
import 'package:spike/src/services/api.dart';

var date = new DateTime.now().toString();
var dateParse = DateTime.parse(date);
var formattedDate = "${dateParse.day} / ${dateParse.month} / ${dateParse.year}";
var dateFinal = formattedDate.toString();

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
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
                '${user.getName()}',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/userProfile.png'),
              ),
              accountEmail: null,
            ),
            ListTile(
              title: Text('Dashboard'),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard', arguments: user);
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
                API api = new API();
                api.list(context: context, user: user);
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
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  title: Center(
                    child: Text(
                      'Welcome, your dashboard!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                _cardWelcome(user),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Add a user linked to the account.',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(38, 193, 101, 1)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/form', arguments: user);
                      },
                      textColor: Colors.white,
                      child: Text(
                        'New User',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Color.fromRGBO(38, 193, 101, 1),
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

Widget _cardWelcome(User user) {
  return Container(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.all(15),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'HELLO ${user.getName()}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    child: Text(
                      'Date',
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 0, bottom: 20),
                    child: Text(
                      "$dateFinal",
                      style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Color.fromRGBO(38, 193, 101, 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
