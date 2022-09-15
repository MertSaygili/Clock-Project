import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.textInputType,
    required this.textInputAction,
    required this.labelText,
    required this.hintText,
    required this.fun,
    this.icon,
  }) : super(key: key);

  final Function fun;
  final Icon? icon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String labelText;
  final String hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      autocorrect: true,
      obscureText: false,
      style: Theme.of(context).textTheme.headline3,
      decoration: InputDecoration(
        contentPadding: PaddingItems().paddingContentTextfield,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.subtitle2,
        labelStyle: Theme.of(context).textTheme.subtitle2,
        isDense: true,
        suffixIcon: widget.icon,
        border: Shapes().borderTextField,
        enabledBorder: Shapes().borderTextField,
      ),
      onChanged: (value) => setState(() => widget.fun(value)),
    );
  }
}
