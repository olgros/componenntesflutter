import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert Page'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              _mostrarAlert(context);
            },
            child: Text('Mostrar Alerta'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.ac_unit_rounded),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Este es el contenido de la alerta'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
          );
        });
  }
}
