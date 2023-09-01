import 'package:flutter/material.dart';
import 'package:onlearner/screens/WelcomeScreen.dart';
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
        backgroundColor: const Color(0xFF34B89B),
        title: const Center(child: Text("Profile")),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                      (Route<dynamic> route) => false,
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Column(
          children: [
            Center(
              child: CustomTextField(
                text: ap.userModel.name,
                text2: 'Name',
              ),
            ),
            CustomTextField(
              text: ap.userModel.phoneNumber,
              text2: 'Phone Number',
            ),
            CustomTextField(
              text: ap.userModel.profession,
              text2: 'Profession',
            ),
            CustomTextField(text: ap.userModel.Class, text2: ap.userModel.profession=='Tutor'?'Will be Teaching in Class':'Class'),
            CustomTextField(
              text: ap.userModel.Subject,
              text2: 'Subject',
            ),
            CustomTextField(
              text: ap.userModel.city,
              text2: 'City',
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Description",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8, left: 8),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(width:.8*MediaQuery.of(context).size.width,child: Text(ap.userModel.description,style: const TextStyle(color: Color(0xFF34B89B),),))),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: GestureDetector(
            onTap: () {
              ap.userSignOut().then(
                    (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                          (Route<dynamic> route) => false,
                    ),
                  );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 201, 69, .83),
                  border: Border.all(
                    color: const Color(0xFAC945),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              constraints: BoxConstraints(
                  minWidth: 200,
                  maxWidth: .5 * MediaQuery.of(context).size.width),
              height: 50,
              child: const Center(
                  child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
        ),
    );
  }
}
