import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:spike/src/services/api.dart';

class Register extends StatelessWidget {
  final _username = TextEditingController();
  final _pwd = TextEditingController();
  final _pwdCfd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/logoSpike.png'),
                  height: 110.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(38, 193, 101, 1)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _username,
                          decoration: InputDecoration(
                              labelText: 'Please enter your username'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _pwd,
                          decoration: InputDecoration(
                              labelText: 'Please enter your password'),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _pwdCfd,
                          decoration: InputDecoration(
                              labelText: 'Please confirm your password'),
                          obscureText: true,
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
                              if (verifiedPwd(_pwd.text, _pwdCfd.text)) {
                                API _api = new API();
                                _api.register(context,
                                    username: _username.text,
                                    password: _pwd.text);
                              } else
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "ERROR",
                                  desc: "Las contraseñas no coinciden",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();
                            },
                            textColor: Colors.white,
                            child: Text(
                              'Submit',
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
          ),
        ),
      ),
    );
  }

  bool verifiedPwd(String text, String text2) {
    bool aux = (text == text2) ? true : false;
    return aux;
  }
}
