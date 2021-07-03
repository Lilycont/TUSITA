import 'package:flutter/material.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/Clients.dart';
import 'package:hcl_zgaf_tdmi_final/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: new ThemeData(
          scaffoldBackgroundColor: Color(0xFFFA8BFF),
        ),
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          print('Ruta ${settings.name}');
          return MaterialPageRoute(
              builder: (BuildContext context) => ClientsPage());
        });
  }
}
