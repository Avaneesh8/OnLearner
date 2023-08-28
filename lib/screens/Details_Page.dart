import 'package:flutter/material.dart';

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
      body: Padding(
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
    );
  }
}
