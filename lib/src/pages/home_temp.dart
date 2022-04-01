import 'dart:collection';

import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = [
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes tempo'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (String opt in opciones) {
      final tempWidget = ListTile(title: Text(opt));
      lista
        ..add(tempWidget)
        ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Prueba subtitle'),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }
}
