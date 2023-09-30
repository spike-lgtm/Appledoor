import 'package:flutter/material.dart';

class CoreComponents {
  static Widget header(String label, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
        ),
        Container(
          height: size.height * 0.0025,
          width: size.width * 0.01,
          color: Colors.blueGrey,
        ),
      ],
    );
  }

  static Widget middleSpace(Size size) {
    return SizedBox(height: size.height * 0.02);
  }

  static Widget formTextField(
      {required String label,
      required bool obscureText,
      required Function(String?) onSaved}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        TextFormField(
          validator: (value) {
            if(value!.length < 1) {
              return "This field is mandatory!";
            }
            return null;
          },
          onSaved: onSaved,
          obscureText: obscureText,
        ),
      ],
    );
  }

  static Widget dropdownField(
      {required String label,
      required String selectedValue,
      required Size size,
      required Map<String, String> dropdownItems,
      required Function(String?) onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        SizedBox(height: size.height * 0.018),
        DropdownButton<String>(
          value: selectedValue,
          items: dropdownItems.keys.map((String key) {
            return DropdownMenuItem<String>(
              value: dropdownItems[key],
              child: Text(key),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
