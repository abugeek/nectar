import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInButton extends StatelessWidget {
  final String svgAsset;
  final String text;
  final Color? background;
  final VoidCallback onPressed;
  const SignInButton({
    super.key,
    required this.text,
    required this.background,
    required this.onPressed,
    required this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: onPressed,
      padding: const EdgeInsets.all(20),
      textStyle: const TextStyle(color: Colors.white, fontSize: 18),
      shape: Theme.of(context).buttonTheme.shape,
      fillColor: background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgAsset),
          const SizedBox(
            width: 20,
          ),
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
