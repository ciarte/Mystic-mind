import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final color = Theme.of(context).colorScheme;
    final border = UnderlineInputBorder(
        borderSide: BorderSide(
          color: color.primary,
        ),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      controller: textController,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: InputDecoration(
          hintText: 'Termina tu mensaje con "?"',
          filled: true,
          enabledBorder: border,
          focusedBorder: border,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              final textValue = textController.value.text;
              focusNode.unfocus();
              textController.clear();
            },
          )),
      onFieldSubmitted: (value) {
        print('submit $value');
        textController.clear();
      },
    );
  }
}
