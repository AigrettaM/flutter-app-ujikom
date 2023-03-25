import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final labeltext;
  final TextEditingController mycontroller;

  MyTextField({
    required this.labeltext,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field cannot be empty";
        }
      },
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: const TextStyle(
            color: Colors.black, fontFamily: 'Raleway_Semibold'),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: (value) {},
    );
  }
}
