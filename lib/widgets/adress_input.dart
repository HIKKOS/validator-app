import 'package:flutter/material.dart';
import 'package:forms_validation/widgets/custom_input.dart';

Map values = {
  'calle': '',
  'numero': '',
  'porCalle': '',
  'yCalle': '',
};

class AdressInput extends StatelessWidget {
  const AdressInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Calle y numero",
            style: TextStyle(
              fontSize: 18,
            )),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: CustomInput(
                    validator: (String? p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "La calle es requerida";
                      }
                      return null;
                    },
                    onChanged: (String? text) {
                      if (text == null) {
                        return;
                      }
                      values['calle'] = text;
                    },
                    hintText: "Calle")),
            const SizedBox(width: 10),
            Expanded(
                flex: 1,
                child: CustomInput(
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "El numero es requerido";
                      }
                      return null;
                    },
                    onChanged: (String? text) {
                      if (text == null) {
                        return;
                      }
                      values['numero'] = text;
                    },
                    hintText: "Numero"))
          ],
        ),
        const Text("Cruzamiento",
            style: TextStyle(
              fontSize: 18,
            )),
        Row(
          children: [
            Expanded(
                child: CustomInput(
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "Entre calle es requerida";
                      }
                      return null;
                    },
                    onChanged: (String? text) {
                      if (text == null) {
                        return;
                      }
                      values['porCalle'] = text;
                    },
                    hintText: "Entre calle")),
            const SizedBox(width: 10),
            Expanded(
                child: CustomInput(
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "Y calle es requerida";
                      }
                      return null;
                    },
                    onChanged: (String? text) {
                      if (text == null) {
                        return;
                      }
                      values['yCalle'] = text;
                    },
                    hintText: "Y calle"))
          ],
        )
      ],
    );
  }
}
