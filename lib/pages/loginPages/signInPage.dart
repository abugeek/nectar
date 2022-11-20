import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:nectar/core/theme.dart';

import '/widgets/buttons/signInButton.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final inputNumberController = TextEditingController();
  MaskInputFormatter myFormatter = MaskInputFormatter(mask: '(##) ###-##-##');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _signInBody(),
    );
  }

  _signInBody() {
    return Stack(
      children: [
        _signInImage(),
        _signInBodyContent(),
      ],
    );
  }

  _signInImage() {
    return Image.asset(
      'assets/images/signInImage.png',
    );
  }

  _signInBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Get your groceries \nwith nectar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CountryCodePicker(
                onChanged: (value) {},
                initialSelection: 'UZ',
                favorite: const ['+998', 'UZ'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
              Expanded(
                child: TextField(
                  inputFormatters: [
                    myFormatter,
                  ],
                  onEditingComplete: () {
                    setState(() {});

                    GoRouter.of(context).push('/Verification');
                  },
                  controller: inputNumberController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: '(--) --- -- --',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: inputBorder,
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(40),
            alignment: Alignment.center,
            child: const Text('Or connect with social media'),
          ),
          SignInButton(
            text: 'Continue with Google',
            background: const Color(0xFF5383EC),
            onPressed: () {
              GoRouter.of(context).push('/Home');
            },
            svgAsset: 'assets/svg/google.svg',
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 40,
            ),
            child: SignInButton(
              text: 'Continue with Facebook',
              background: const Color(0xFF4A66AC),
              onPressed: () {
                GoRouter.of(context).go('/Home');
              },
              svgAsset: 'assets/svg/facebook.svg',
            ),
          ),
          /* const SizedBox(
            height: 50,
          ), */
        ],
      ),
    );
  }

  _countryCodePicker() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CountryCodePicker(
          initialSelection: '+998',
          padding: EdgeInsets.zero,
          flagWidth: 25,
          showCountryOnly: false,
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
