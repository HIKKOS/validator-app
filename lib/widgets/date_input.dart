import 'package:flutter/material.dart';
import 'package:forms_validation/widgets/custom_input.dart';

final today = DateTime.now();
Map date = {
  'month': '',
  'year': '${today.year}',
};

class CCDateInput extends StatelessWidget {
  const CCDateInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Fecha de vencimiento",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            CustomInput(
                validator: (String? text) {
                  if (text == null) {
                    return "El mes es requerido";
                  }
                  final month = int.tryParse(text);
                  if (month == null) {
                    return "El mes debe ser numerico";
                  }
                  if (month < 1 || month > 12) {
                    return "Mes invalido";
                  }
                  if (month < today.month &&
                      date['year'] == today.year.toString()) {
                    return "El mes no puede ser menor al actual";
                  }

                  return null;
                },
                onChanged: (String? text) {
                  if (text == null) {
                    return;
                  }
                  date['month'] = text;
                },
                hintText: "MM"),
            const SizedBox(height: 10),
            CustomInput(
                validator: (String? text) {
                  if (text == null) {
                    return "El año es requerido";
                  }
                  final year = int.tryParse(text);
                  if (year == null) {
                    return "El año debe ser un número";
                  }
                  if (year < today.year) {
                    return "El año no puede ser menor al actual";
                  }
                  if (year > today.year + 10) {
                    return "El año no puede ser mayor a ${today.year + 10}";
                  }
                  return null;
                },
                onChanged: (String? text) {
                  if (text == null) {
                    return;
                  }
                  date['year'] = text;
                },
                hintText: "YYYY"),
            const SizedBox(height: 10),
            CustomInput(
                validator: (String? text) {
                  if (text == null) {
                    return "El CVV es requerido";
                  }
                  final cvv = int.tryParse(text);
                  if (cvv == null) {
                    return "El CVV debe ser un número";
                  }
                  if (text.length != 3) {
                    return "El CVV debe tener 3 dígitos";
                  }
                  return null;
                },
                onChanged: (String? text) {},
                hintText: "CVV"),
          ],
        ),
      ],
    );
  }
}
