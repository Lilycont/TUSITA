import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:hcl_zgaf_tdmi_final/src/models/appointment_model.dart';
import 'package:hcl_zgaf_tdmi_final/src/providers/appt_provider.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  createState() {
    return _AppointmentsPage();
  }
}

class _AppointmentsPage extends State<AppointmentsPage> {
  int _currentIndex = 2;
  ApptModel appt = new ApptModel();
  final apptProvider = new ApptProvider();
  @override
  Widget build(BuildContext context) {
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
          child: _crearListado()),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.login_outlined, size: 30),
                label: ' ',
                backgroundColor: Colors.white.withOpacity(0.2)),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Icon(Icons.person_outline, size: 30),
                ),
                label: ' ',
                backgroundColor: Colors.white.withOpacity(0.2)),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Icon(Icons.list_outlined, size: 30),
                ),
                label: ' ',
                backgroundColor: Colors.white.withOpacity(0.2)),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined, size: 30),
                label: ' ',
                backgroundColor: Colors.white.withOpacity(0.2)),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.pushNamed(context, 'clients');
                break;
              case 3:
                Navigator.pushNamed(context, 'report');
                break;
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.grey),
          onPressed: () {
            Navigator.pushNamed(context, 'new-appt');
          },
          backgroundColor: Colors.white),
    );
  }

  Widget _cardT1({title, value}) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 0,
        color: Colors.white.withOpacity(0.3),
        child: Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: ListTile(
                title: Text(title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    )),
              )),
        ]));
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: apptProvider.cargarCitas(),
      builder: (BuildContext context, AsyncSnapshot<List<ApptModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (contex, i) => _crearItem(context, productos[i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ApptModel app) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 0,
            color: Colors.white.withOpacity(0.3),
            child: Column(children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: ListTile(
                    leading: Text('\$${app.cost} MXN',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                    title: Text('${app.reason}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),
                  )),
            ])));
  }
}
