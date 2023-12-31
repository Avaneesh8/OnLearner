import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onlearner/screens/WelcomeScreen.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () {
        final ap = Provider.of<AuthProvider>(context, listen: false);
        if (ap.isSignedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: const Color.fromRGBO(52, 184, 155, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(width: 250, image: AssetImage('images/onlearner_whitelogo.png')),
              Text(
                "OnLearner",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
