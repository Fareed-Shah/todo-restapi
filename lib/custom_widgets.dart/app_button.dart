import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AppButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 27, bottom: 20, top: 15.0),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff5D5D67)),
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff1E1C24)),
              child: GestureDetector(
                onTap: onPressed,
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              )),
        ),
      ],
    );
  }
}
