import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final String placeholder;
  TextEditingController textEditingController;

  UserTextField(
      {required this.placeholder, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 27),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff5D5D67)),
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff1E1C24)),
      child: TextFormField(
        controller: textEditingController,
        style: const TextStyle(color: Colors.grey, fontSize: 15),
        decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
            border: InputBorder.none),
      ),
    );
  }
}
