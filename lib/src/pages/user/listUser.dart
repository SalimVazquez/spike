import 'package:flutter/material.dart';
import 'package:spike/src/models/ScreenArguments.dart';
import 'package:spike/src/models/User.dart';
import 'package:spike/src/services/api.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuarios',
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
                'Nombre del usuario',
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
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: user.getChildrens().length,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  )
                ]),
            child: ListTile(
              title: Text(
                  '${user.getChildrens()[index].getName()} ${user.getChildrens()[index].getLastName()}'),
              subtitle: Text('${user.getChildrens()[index].getEmail()}'),
              leading: Icon(Icons.perm_contact_cal_sharp),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/profile',
                    arguments:
                        ScreenArguments(user, user.getChildrens()[index]));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromRGBO(38, 193, 101, 1),
      ),
    );
  }
}
