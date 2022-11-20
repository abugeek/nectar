import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar/widgets/buttons/greenButton.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _onBoardingBody(),
    );
  }

  Widget _onBoardingBody() {
    return Stack(
      children: [
        _onBoardingImage(),
        _onBoardingInfo(),
      ],
    );
  }

  _onBoardingImage() {
    return Image.asset(
      'assets/images/welcomePage.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  _onBoardingInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/svg/nectarLogo.svg',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Welcome \nto our store',
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            'Get your groceries in as fasy as one hour',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            width: 353,
            height: 67,
            child: GreenButton(
              onPressed: () {
                GoRouter.of(context).go('/SignIn');
              },
              text: 'Get Started',
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
