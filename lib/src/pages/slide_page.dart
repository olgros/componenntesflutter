import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearChebox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño imagen',
        //divisions: 20,
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i.pinimg.com/550x/b6/d6/13/b6d61308f9e84af4f8d73a2b15f48fec.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearChebox() {
    /* return Checkbox(
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        });*/

    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor ?? false;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
