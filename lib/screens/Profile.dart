import 'package:flutter/material.dart';
import 'package:onlearner/screens/WelcomeScreen.dart';
import 'package:onlearner/screens/home.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widgets/Profile_text_views.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34B89B),
        title: Center(child: const Text("Profile")),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*Padding(
          padding: const EdgeInsets.only(left: 35,bottom: 30),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Profile',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(161, 128, 48, 1),
                fontSize: 45,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.63,
              ),
            ),
          ),
        ),*/
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Column(
          children: [
            Center(
              child: CustomTextField(
                text: '${ap.userModel.name}',
                text2: 'Name',
              ),
            ),
            CustomTextField(
              text: '${ap.userModel.phoneNumber}',
              text2: 'Phone Number',
            ),
            CustomTextField(
              text: '${ap.userModel.profession}',
              text2: 'Profession',
            ),
            CustomTextField(text: '${ap.userModel.Class}', text2: 'Class'),
            CustomTextField(
              text: '${ap.userModel.Subject}',
              text2: 'Subject',
            ),
            CustomTextField(
              text: '${ap.userModel.city}',
              text2: 'City',
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Description",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8, left: 8),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(width:.8*MediaQuery.of(context).size.width,child: Text(ap.userModel.description,style: TextStyle(color: Colors.blueAccent),))),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: GestureDetector(
            onTap: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 201, 69, .83),
                  border: Border.all(
                    color: Color(0xFAC945),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              constraints: BoxConstraints(
                  minWidth: 200,
                  maxWidth: .5 * MediaQuery.of(context).size.width),
              height: 50,
              child: Center(
                  child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
            ),
          ),
        ),
      ],
        ),
    );
  }
}
