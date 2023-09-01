// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../widgets/HomeButton.dart';
import '../DownloadNotes.dart';
import 'HomeTutor.dart';
import '../Profile.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({Key? key}) : super(key: key);

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF34B89B),
        title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                ),
                const Text("Home"),
              ],
            )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .12,
                ),
                Image.asset(
                  "images/onlearner_whitelogo.png",
                  height: 150,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
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
                  height: MediaQuery.of(context).size.height * .08,
                ),
                HomeButton(text: 'Home Tutor', onPressed: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeTutor()),
                  );
                },),
                HomeButton(text: 'Download Notes', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DownloadNotes()),
                  );
                },),
              ]),
        ),
      ),
    );
  }
}
