import 'package:flutter/material.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailNode;
  const EmailInputWidget({super.key, required this.emailNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: emailNode,
      decoration: InputDecoration(hintText: 'Email', border: OutlineInputBorder()),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter email';
        }
        return null;
      },
      onFieldSubmitted: (value) {},
    );
  }
}
