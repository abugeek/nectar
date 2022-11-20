import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

import '../../core/theme.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  MaskInputFormatter myFormatter = MaskInputFormatter(mask: '####');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _numberPageBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 16, left: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Resend Code'),
            ),
            FloatingActionButton(
              onPressed: (() {}),
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  _numberPageBody() {
    return Stack(
      children: [
        _numberPageBack(),
        _signInBodyContent(),
      ],
    );
  }

  _numberPageBack() {
    return Image.asset(
      'assets/images/blurBack.png',
    );
  }

  _signInBodyContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Enter your 4-digit code',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Code',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: TextField(
              inputFormatters: [
                myFormatter,
              ],
              onEditingComplete: () {
                setState(() {});
                GoRouter.of(context).push('/Home');
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: '- - - -',
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
    );
  }

  _countryCodePicker() {
    return CountryCodePicker(
      initialSelection: '+998',
      padding: EdgeInsets.zero,
      flagWidth: 25,
      showCountryOnly: false,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}
