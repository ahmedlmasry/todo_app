import 'package:flutter/material.dart';

Widget defalutFormfeild({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? onTap,
  ValueChanged<String>? onChanged,
  required FormFieldValidator<String> valdiate,
  required String label,
  required IconData prefix,
  bool ispassword = false,
  IconData? suffix,
  Function? suffixpressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      validator: valdiate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixpressed!();
                },
                icon: Icon(suffix))
            : null,
        border: const OutlineInputBorder(),
      ),
    );
