import 'package:flutter/material.dart';
import 'package:forms_validation/widgets/adress_input.dart';
import 'package:forms_validation/widgets/custom_input.dart';
import 'package:forms_validation/widgets/date_input.dart';
import 'package:forms_validation/widgets/usuario_input.dart';

final today = DateTime.now();
Map values = {
  'nombre': '',
  'apellido': '',
  'calle': '',
  'numero': '',
  'porCalle': '',
  'yCalle': '',
  'tarjeta': '',
  'mes': '',
  'anio': '',
  'cvv': '',
};
final key = GlobalKey<FormState>();

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: ListView(
            children: <Widget>[
              UsuarioInput(
                label: "Nombre",
                onChanged: (String? text) {
                  values['nombre'] = text;
                },
              ),
              UsuarioInput(
                label: "Apellido",
                onChanged: (String? text) {},
              ),
              const AdressInput(),
              CustomInput(
                hintText: "1234 5678 1234 5678",
                label: "Tarjeta",
                validator: masterCardValidator,
                onChanged: (String? text) {},
              ),
              const SizedBox(height: 10),
              const CCDateInput(),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (!key.currentState!.validate()) {
                      return;
                    }
                  },
                  child: const Text('Enviar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String? masterCardValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo requerido';
  }
  final RegExp regExp =
      RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$');
  final hasMatch = regExp.hasMatch(value);
  return hasMatch ? null : 'Tarjeta invalida';
}

bool visaValidator(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  final RegExp regExp = RegExp(r'^[0-9]{16}$');
  return regExp.hasMatch(value);
}

String? yearValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo requerido';
  }

  final int? month = int.tryParse(value);
  if (month == null) {
    return 'Por favor ingrese un valor numérico';
  }
  if (month < today.year) {
    return 'Año invalido';
  } else {
    values['mes'] = (month < 10) ? '0$month' : '$month';
  }

  return null;
}

String? monthValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo requerido';
  }

  final int? month = int.tryParse(value);
  if (month == null) {
    return 'Por favor ingrese un valor numérico';
  }
  if (month < 1 || month > 12) {
    return 'Mes invalido';
  } else {
    values['mes'] = (month < 10) ? '0$month' : '$month';
  }

  return null;
}
