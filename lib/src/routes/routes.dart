import 'package:flutter/material.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/Appts.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/Clients.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/Login.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/NewAppt.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/NewClient.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/Report.dart';
import 'package:hcl_zgaf_tdmi_final/src/pages/SignUp.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'signup': (BuildContext context) => SignUpPage(),
    'clients': (BuildContext context) => ClientsPage(),
    'appts': (BuildContext context) => AppointmentsPage(),
    'report': (BuildContext context) => ReportPage(),
    'new-client': (BuildContext context) => NewClientPage(),
    'new-appt': (BuildContext context) => NewAppointmentPage()
  };
}
