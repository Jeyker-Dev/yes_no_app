import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();

    final focusNode = FocusNode();

    final outLineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.all(Radius.circular(40)),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;

          if (textValue.isNotEmpty) {
            textController.clear();
          }
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        if (kDebugMode) {
          print('value: $value');
          textController.clear();
          focusNode.requestFocus();
          onValue(value);
        }
      },
    );
  }
}
