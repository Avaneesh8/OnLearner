import 'package:flutter/material.dart';
import 'package:onlearner/screens/home.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({Key? key}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController Class = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController Description = TextEditingController();
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
        offset: Class.text.length,
      ),
    );
    Description.selection=TextSelection.fromPosition(
      TextPosition(
        offset: Class.text.length,
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
              child: FittedBox(
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
                  hintStyle: TextStyle(
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
                controller: name,
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
                  hintText: "Classes",
                  hintStyle: TextStyle(
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
                controller: name,
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
                  hintStyle: TextStyle(
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
                  controller: name,
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
                    hintStyle: TextStyle(
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
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
}
