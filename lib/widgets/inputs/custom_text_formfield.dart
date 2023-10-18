import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.inputName,
  });

  final String inputName;

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
          // style: const TextStyle(color: Colors.blue),
          validator: (_input) {},
          onSaved: (_input) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(255, 255, 255, 0.6),
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
