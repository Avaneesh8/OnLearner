import 'package:flutter/material.dart';
import 'package:onlearner/screens/Profile.dart';
import 'package:onlearner/widgets/HomeButton.dart';
import 'package:onlearner/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34B89B),
        title: Center(child: const Text("Home ")),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              Image.asset(
                "images/onlearner_whitelogo.png",
                height: 250,
              ),
                HomeButton(text: 'Home Tutor', onPressed: (){}),
                HomeButton(text: 'Upload Notes', onPressed: (){}),
                HomeButton(text: 'Download Notes', onPressed: (){}),

            ]
          ),
        ),
      ),
    );
  }
}
