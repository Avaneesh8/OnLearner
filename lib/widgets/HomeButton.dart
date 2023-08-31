import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const HomeButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: onPressed,
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
                text,
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
        ),
      ),
    );
  }
}