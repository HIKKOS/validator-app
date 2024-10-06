import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? label;
  final String hintText;
  final IconData? iconData;
  final String? initialValue;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  const CustomInput({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.iconData,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.validator,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    late final Widget body;

    if (label == null) {
      body = TextFormField(
          controller: controller,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintText,
            prefixIcon: iconData != null ? Icon(iconData) : null,
          ));
    } else {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label!,
              style: const TextStyle(
                fontSize: 18,
              )),
          const SizedBox(height: 10),
          TextFormField(
              controller: controller,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              onChanged: onChanged,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: hintText,
                prefixIcon: iconData != null ? Icon(iconData) : null,
              )),
        ],
      );
    }
    return body;
  }
}
