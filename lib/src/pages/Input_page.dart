import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccinada = 'Volar';

  List _poderes = ['Volar', 'rayos x', 'Super fuerza', 'Prueba'];

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearPersona(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras  ${_nombre.length} '),
          hintText: 'Nombre persona',
          labelText: 'Nombre',
          helperText: 'Solo letras',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombres es :$_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccinada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras  ${_nombre.length} '),
          hintText: 'Nombre persona',
          labelText: 'Nombre',
          helperText: 'Solo letras',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      // autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras  ${_nombre.length} '),
          hintText: 'Pasword persona',
          labelText: 'pasword',
          helperText: 'Solo letras',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras  ${_nombre.length} '),
          hintText: 'Fecha  persona',
          labelText: 'fecha',
          helperText: 'Solo letras',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
            child: DropdownButton(
          value: _opcionSeleccinada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccinada = opt.toString();
            });
          },
        ))
      ],
    );
  }
}
