import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final String obscureCharacter;
  final Widget visibleIcon;
  final Widget invisibleIcon;
  const PasswordTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.visibleIcon = const Icon(Icons.visibility),
    this.invisibleIcon = const Icon(Icons.visibility_off),
    this.obscureCharacter = '•',
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      obscuringCharacter: widget.obscureCharacter,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: _toggleVisibility,
          icon: _obscureText ? widget.visibleIcon : widget.invisibleIcon,
        ),
      ),
    );
  }
}
