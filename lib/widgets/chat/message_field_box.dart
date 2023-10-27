import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color.fromRGBO(168, 168, 168, 1), width: 2.0),
        borderRadius: BorderRadius.circular(20));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textController,
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        decoration: InputDecoration(
            // hintText: 'Termina tu mensaje con "?"',
            filled: true,
            enabledBorder: border,
            focusedBorder: border,
            suffixIcon: IconButton(
              color: color.primary,
              icon: const Icon(Icons.send),
              onPressed: () {
                final textValue = textController.value.text;
                onValue(textValue);
                focusNode.unfocus();
                textController.clear();
              },
            )),
        onFieldSubmitted: (value) {
          textController.clear();
        },
      ),
    );
  }
}
