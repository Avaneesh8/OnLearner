// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:onlearner/screens/home.dart';
import 'package:provider/provider.dart';
import '../../model/user_model.dart';
import '../../provider/auth_provider.dart';

class Detailspage extends StatefulWidget {
  final String city;
  final String profession;
  const Detailspage({super.key, required this.city,required this.profession});


  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController Class = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController Description = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    Class.dispose();
    subject.dispose();
    Description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    name.selection = TextSelection.fromPosition(
      TextPosition(
        offset: name.text.length,
      ),
    );
    Class.selection=TextSelection.fromPosition(
      TextPosition(
        offset: Class.text.length,
      ),
    );
    subject.selection=TextSelection.fromPosition(
      TextPosition(
        offset: subject.text.length,
      ),
    );
    Description.selection=TextSelection.fromPosition(
      TextPosition(
        offset: Description.text.length,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.12,
            ),
            SizedBox(
              width: .75 * MediaQuery.of(context).size.width,
              height: .1 * MediaQuery.of(context).size.height,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Details Page',
                  style: TextStyle(
                    color: Color.fromRGBO(161, 128, 48, 1),
                    fontSize: 35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.005,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: TextFormField(
                cursorColor: Colors.black,
                controller: name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    name.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xFFA69E9E),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFF34B89B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.005,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: TextFormField(
                cursorColor: Colors.black,
                controller: Class,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    Class.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: widget.profession=='Tutor'?"Will be Teaching in Class":"class",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xFFA69E9E),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFF34B89B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.005,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                controller: subject,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    subject.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Subject",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xFFA69E9E),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFF34B89B)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.005,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: TextFormField(
                  cursorColor: Colors.black,
                  controller: Description,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      Description.text = value;
                    });
                  },
                maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Color(0xFFA69E9E),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFF34B89B)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.035,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: ()=>storeData(),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 201, 69, .83),
                      border: Border.all(
                        color: const Color(0x00fac945),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(25))),
                  constraints: BoxConstraints(
                      minWidth: 200,
                      maxWidth: .5 * MediaQuery.of(context).size.width),
                  height: 50,
                  child: const Center(
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: name.text.trim(),
      Class: Class.text.trim(),
      description: Description.text.trim(),
      Subject : subject.text.trim(),
      createdAt: "",
      phoneNumber: "",
      uid: "",
      city :widget.city.trim(),
      profession: widget.profession.trim(),
    );
    ap.saveUserDataToFirebase(
      context: context,
      userModel: userModel,
      onSuccess: () {
        ap.saveUserDataToSP().then(
              (value) => ap.setSignIn().then(
                (value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                    (route) => false),
          ),
        );
      },
    );
  }
}

