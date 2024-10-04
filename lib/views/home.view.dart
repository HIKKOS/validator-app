import 'package:flutter/material.dart';
import 'package:forms_validation/widgets/custom_input.dart';
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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
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
          CustomInput(
            hintText: "Calle",
            iconData: Icons.home,
            validator: (p0) =>
                p0 != null && p0.isNotEmpty ? null : "Campo requerido",
            label: "Calle",
            onChanged: (String? text) {},
          ),
          CustomInput(
            label: "01",
            hintText: "Numero de calle",
            iconData: Icons.numbers,
            validator: (p0) {
              String validatorText = "";
              if (p0 == null || p0.isEmpty) {
                validatorText = 'Campo requerido';
                return validatorText;
              }
              if (double.tryParse(p0) == null) {
                validatorText = 'Por favor valor numérico';
              }
              return validatorText;
            },
            onChanged: (String? text) {
              bool isNumeric = double.tryParse(text!) != null;
              if (isNumeric) {
                values['numero'] = text;
              }
            },
          ),
          CustomInput(
            iconData: Icons.location_on,
            hintText: "01",
            label: "Por calle",
            validator: (p0) =>
                p0 != null && p0.isNotEmpty ? null : "Campo requerido",
            onChanged: (String? text) {},
          ),
          CustomInput(
            hintText: "02",
            label: "Y calle",
            validator: (p0) =>
                p0 != null && p0.isNotEmpty ? null : "Campo requerido",
            onChanged: (String? text) {},
          ),
          CustomInput(
            hintText: "1234 5678 1234 5678",
            label: "Tarjeta",
            validator: masterCardValidator,
            onChanged: (String? text) {},
          ),
          CustomInput(
            hintText: "MM",
            label: "Mes",
            validator: monthValidator,
            onChanged: (String? text) {},
          ),
          CustomInput(
            hintText: "YYYY",
            label: "Año",
            validator: yearValidator,
            onChanged: (String? text) {},
          ),
          CustomInput(
            hintText: "CVV",
            label: "cvv",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Campo requerido';
              }
              final RegExp regExp = RegExp(r'^[0-9]{3}$');
              final hasMatch = regExp.hasMatch(value);
              return hasMatch ? null : 'CVV invalido';
            },
            onChanged: (String? text) {},
          ),

          ///
        ],
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
