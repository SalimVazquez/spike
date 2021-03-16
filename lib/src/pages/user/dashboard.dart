import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Container(
            child: Column(
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
                _cardData(),
                _cardAddress(),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/update');
                      },
                      textColor: Colors.white,
                      child: Text(
                        'Edit my profile',
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

Widget _cardData() {
  return Container(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/userProfile.png'),
                  height: 110.0,
                ),
                Column(
                  children: [
                    Text(
                      'Magdalena de la Cruz Ordoñez',
                      style: TextStyle(
                          color: Color.fromRGBO(38, 193, 101, 1), fontSize: 16),
                    ),
                    Text(
                      'Member since: 25 March, 2021',
                      style: TextStyle(
                          color: Color.fromRGBO(195, 195, 195, 1),
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        '25',
                        style: TextStyle(
                            color: Color.fromRGBO(38, 193, 101, 1),
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Age',
                        style: TextStyle(
                            color: Color.fromRGBO(195, 195, 195, 1),
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Container(height: 55, child: VerticalDivider()),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'magda@example.com',
                        style: TextStyle(
                            color: Color.fromRGBO(38, 193, 101, 1),
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Color.fromRGBO(195, 195, 195, 1),
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _cardAddress() {
  return Container(
    child: SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/address.png')),
                ),
              ),
            ),
            Flexible(
              child: Text(
                'Avenida Puerto Angel S/N Colonia Centro CP. 70600',
                style: TextStyle(
                    color: Color.fromRGBO(38, 193, 101, 1), fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}