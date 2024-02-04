import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.inputName,
    this.onChanged,
    this.validator,
    this.controller,
    this.hint,
    this.isNumber,
  });

  final bool? isNumber;
  final String inputName;
  final String? hint;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 3,
        color: Color.fromRGBO(168, 168, 168, 1),
      ),
    );
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(inputName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ))),
        TextFormField(
          autocorrect: false,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          // onSaved: (_input) {},
          keyboardType:
              isNumber != null ? TextInputType.number : TextInputType.text,

          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color.fromRGBO(255, 255, 255, 0.6),
            enabledBorder: border,
            focusedBorder: border.copyWith(
                borderSide: const BorderSide(
              color: Color.fromRGBO(168, 168, 168,
                  1), // Cambia el color del borde cuando se enfoca
              width: 2.0, // Cambia el grosor del borde cuando se enfoca
            )),
            isDense: true,
            // errorText: errorMessage,
            // errorBorder: border.copyWith(
            //     borderSide: BorderSide(
            //   color: color.error,
            //   width: 1.5,
            // )),
            focusedErrorBorder: border.copyWith(
                borderSide: const BorderSide(
              // color: color.error,
              width: 1.5,
            )),
          ),
        ),
      ],
    );
  }
}
