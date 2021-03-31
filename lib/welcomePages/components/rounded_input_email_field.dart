import 'package:flutter/material.dart';
import 'package:GRSON/welcomepages/components/text_field_container.dart';
import 'package:GRSON/welcomepages/constants.dart';

class RoundedInputEmailField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputEmailField({
    Key key,
    this.hintText,
     this.icon = Icons.email,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller:controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
