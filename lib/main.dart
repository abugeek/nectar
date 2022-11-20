import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '/pages/loginPages/verificationPage.dart';
import '/pages/welcomePages/onBoardingPage.dart';
import '/core/theme.dart';
import '/pages/loginPages/signInPage.dart';
import 'pages/productPages/homePage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: _router,

      theme: lightTheme,
      //home: const OnboardingPage(),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/SignIn',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: '/Verification',
        builder: (BuildContext context, GoRouterState state) {
          return const VerificationPage();
        },
      ),
      GoRoute(
        path: '/Home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ],
  );
}
