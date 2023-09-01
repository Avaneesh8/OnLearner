import 'package:flutter/material.dart';
import 'package:onlearner/screens/DownloadNotes.dart';
import 'package:onlearner/screens/tutor/Upload_Notes.dart';
import '../../widgets/HomeButton.dart';
import '../Profile.dart';

class HomeScreenTutor extends StatefulWidget {
  const HomeScreenTutor({Key? key}) : super(key: key);

  @override
  State<HomeScreenTutor> createState() => _HomeScreenTutorState();
}

class _HomeScreenTutorState extends State<HomeScreenTutor> {
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
                Text(
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
                HomeButton(text: 'Upload Notes', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadNotes()),
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
