import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:hcl_zgaf_tdmi_final/src/models/client_model.dart';
import 'package:hcl_zgaf_tdmi_final/src/providers/client_provider.dart';

class NewClientPage extends StatelessWidget {
  final clientProvider = new ClientProvider();
  ClientModel client = new ClientModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFFFA8BFF), Color(0xFF2BD2FF), Color(0xFF2BFF88)],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 200,
                right: 0.0,
                left: 0.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          borderRadius: BorderRadius.circular(16.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 40.0,
                              sigmaY: 40.0,
                            ),
                            child: Container(
                              height: 520,
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
                                          vertical: 20, horizontal: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.only(top: 50),
                                              child: Column(children: <Widget>[
                                                _inputName(label: "Nombre"),
                                                _inputLastName(
                                                    label: "Apellidos"),
                                                _inputAge(label: "Edad"),
                                                _inputDescription(
                                                    label: "Descripción",
                                                    height: 7.0),
                                                _button(context),
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
                    ])),
            Positioned(
                top: 50,
                right: 0.0,
                left: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              spreadRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 40.0,
                            sigmaY: 40.0,
                          ),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white.withOpacity(0.2),
                                )),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(children: <Widget>[
                                              Icon(Icons.person,
                                                  size: 120,
                                                  color: Colors.white)
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
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _button(context) {
    return Padding(
      padding: EdgeInsets.only(left: 200, top: 40),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          clientProvider.crearCliente(client);
          Navigator.pushNamed(context, 'clients');
        },
        color: Colors.white.withOpacity(0.3),
        elevation: 0,
        child: Text(
          "AGREGAR",
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

  Widget _inputName({label, height = 1.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        TextField(
          style: TextStyle(
            height: height,
          ),
          onChanged: (value) => client.name = value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              hintText: label,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              border: OutlineInputBorder()),
        ),
      ],
    );
  }

  Widget _inputLastName({label, height = 1.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        TextField(
          style: TextStyle(
            height: height,
          ),
          onChanged: (value) => client.lastName = value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              hintText: label,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              border: OutlineInputBorder()),
        ),
      ],
    );
  }

  Widget _inputAge({label, height = 1.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        TextField(
          style: TextStyle(
            height: height,
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) => client.age = int.parse(value),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              hintText: label,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              border: OutlineInputBorder()),
        ),
      ],
    );
  }

  Widget _inputDescription({label, height = 1.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        TextField(
          style: TextStyle(
            height: height,
          ),
          onChanged: (value) => client.description = value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              hintText: label,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
