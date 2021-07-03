import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:hcl_zgaf_tdmi_final/src/models/appointment_model.dart';
import 'package:hcl_zgaf_tdmi_final/src/providers/appt_provider.dart';

class NewAppointmentPage extends StatefulWidget {
  @override
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  TextEditingController _inputFieldDateController = new TextEditingController();
  String _fecha = '';
  ApptModel appt = new ApptModel();
  final apptProvider = new ApptProvider();
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text('Nueva Cita',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 25)),
            ),
            Center(
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
                      height: 420,
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
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: <Widget>[
                                        _inputReason(label: "Motivo"),
                                        _dateInput(context,
                                            label: "Fecha Cita"),
                                        _inputCost(label: "Costo"),
                                        _button(),
                                      ],
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: EdgeInsets.only(left: 200, top: 40),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          apptProvider.crearCita(appt);
          Navigator.pushNamed(context, 'appts');
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

  Widget _inputReason({label, lockIcon = false}) {
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
          onChanged: (value) => appt.reason = value,
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

  Widget _inputCost({label, lockIcon = false}) {
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
          keyboardType: TextInputType.number,
          onChanged: (value) => appt.cost = double.parse(value),
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

  Widget _clientInput({label, lockIcon = false}) {
    var _icon = Icon(
      Icons.arrow_drop_down,
      color: Colors.white,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextField(
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

  Widget _dateInput(BuildContext context, {label}) {
    var _icon = Icon(
      Icons.calendar_today,
      color: Colors.white,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: _inputFieldDateController,
          enableInteractiveSelection: false,
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
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectFecha(context);
          },
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  void _selectFecha(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2017),
      lastDate: new DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _fecha = DateFormat('dd/MM/yyyy').format(picked).toString();
        _inputFieldDateController.text = _fecha;
        appt.finished = DateFormat('yyyy-MM-dd').format(picked).toString();
      });
    }
  }
}
