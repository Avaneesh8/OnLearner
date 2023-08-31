import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String text2;
  const CustomTextField({super.key, required this.text,required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(alignment: Alignment.topLeft,child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(text2,style: TextStyle(color: Colors.grey),),
          )),
          Padding(
            padding: const EdgeInsets.only(top:16.0,bottom: 8,left: 8),
            child: Align(alignment: Alignment.topLeft,child: Text(text,style: TextStyle(color: Colors.blueAccent),)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8,bottom: 8),
            child: Align(
            alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width*.75,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: .5,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xCBCBCBD8),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );/*Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: .04 * MediaQuery.of(context).size.height,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF34B89B)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          )),
    );*/
  }
}
