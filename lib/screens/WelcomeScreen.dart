// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:onlearner/provider/auth_provider.dart';
import 'package:onlearner/screens/Authentication/Login.dart';
import 'package:onlearner/screens/home.dart';
import 'package:onlearner/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child:  SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*.1,
                        ),
                        const Text(
                          'ONLearner',
                          style: TextStyle(
                            color: Color.fromRGBO(161, 128, 48, 1),
                            fontSize: 35,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*.075,
                        ),
                        Image.asset(
                          "images/onlearner_whitelogo.png",
                          height: 270,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Let's get started",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Never a better time than now to start.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // custom button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CustomButton(
                            onPressed: () async {
                              if (ap.isSignedIn == true) {
                                await ap.getDataFromSP().whenComplete(
                                      () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                );
                              }
                            },
                            text: "Get started",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Created by',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Image.asset(
                            'images/av_logo.png',
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
