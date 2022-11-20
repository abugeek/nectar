import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final Color? background;
  final VoidCallback onPressed;
  const GreenButton(
      {super.key,
      required this.text,
      this.background,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: onPressed,
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(color: Colors.white, fontSize: 18),
      shape: Theme.of(context).buttonTheme.shape,
      fillColor:
          background ?? Theme.of(context).buttonTheme.colorScheme!.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
