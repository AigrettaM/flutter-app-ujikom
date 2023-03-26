import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final labeltext, hintedtext;
  final TextEditingController mycontroller;

  MyTextField({
    required this.labeltext,
    required this.mycontroller,
    required this.hintedtext,
    required TextInputType keyboardType,
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
        hintText: hintedtext,
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        labelStyle: const TextStyle(
            color: Colors.black, fontFamily: 'Raleway_Semibold'),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.deepPurple),
          borderRadius: new BorderRadius.circular(20),
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
