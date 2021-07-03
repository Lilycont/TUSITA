import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:hcl_zgaf_tdmi_final/src/providers/user_provider.dart';
import 'package:hcl_zgaf_tdmi_final/src/models/user_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage();

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userProvider = new UserProvider();
  UserModel user = new UserModel();
  @override
  Widget build(BuildContext context) {
    final _context = context;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFFFA8BFF), Color(0xFF2BD2FF), Color(0xFF2BFF88)],
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 24,
                spreadRadius: 16,
                color: Colors.black.withOpacity(0.1),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 40.0,
                  sigmaY: 40.0,
                ),
                child: Container(
                  height: 550,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      )),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 60, horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: 24,
                                    spreadRadius: 16,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 40.0,
                                      sigmaY: 40.0,
                                    ),
                                    child: Container(
                                      height: 75,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(45.0),
                                          border: Border.all(
                                            width: 1.5,
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          )),
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      child: Text('SignUp',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          )))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Column(children: <Widget>[
                                    _inputEmail(label: "Email"),
                                    _inputUser(label: "User"),
                                    _inputPass(
                                        label: "Password", lockIcon: true),
                                    _button(_context),
                                  ])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 175, top: 40),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          userProvider.crearUsuario(user);
          Navigator.pushNamed(context, '/');
        },
        color: Colors.white.withOpacity(0.3),
        elevation: 0,
        child: Text(
          "REGISTER",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.white, width: 1)),
      ),
    );
  }

  Widget _inputEmail({label, lockIcon = false}) {
    var _icon;
    if (lockIcon) {
      _icon = Icon(
        Icons.lock,
        color: Colors.white,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextField(
          onChanged: (value) => user.email = value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              hintText: label,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              suffixIcon: _icon,
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _inputUser({label, lockIcon = false}) {
    var _icon;
    if (lockIcon) {
      _icon = Icon(
        Icons.lock,
        color: Colors.white,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextField(
          onChanged: (value) => user.username = value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              hintText: label,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              suffixIcon: _icon,
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _inputPass({label, lockIcon = false}) {
    var _icon;
    if (lockIcon) {
      _icon = Icon(
        Icons.lock,
        color: Colors.white,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: true,
          onChanged: (value) => user.password = value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              hintText: label,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              suffixIcon: _icon,
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
