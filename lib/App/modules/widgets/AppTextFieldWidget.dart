import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.maxLines,
    this.validator,
    this.readOnly,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.enabled, this.inputFormatters,
  }) : super(key: key);
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final int? maxLines;
  final Function(String?)? validator;
  final bool? readOnly;
  final bool? enabled;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      enabled: enabled,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor:
            enabled == false ? Colors.grey.withOpacity(.2) : Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFF6A7189),
          fontSize: 16,
        ),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        // enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   borderSide: BorderSide(color: Colors.transparent),
        // ),
        // focusedBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   borderSide: BorderSide(color: Colors.transparent),
        //
        // ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
