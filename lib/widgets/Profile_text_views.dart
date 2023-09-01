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
            padding: const EdgeInsets.only(left: 8,top: 10),
            child: Text(text2,style: const TextStyle(color: Colors.grey),),
          )),
          Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8,left: 8),
            child: Align(alignment: Alignment.topLeft,child: Text(text,style: const TextStyle(color: Color(0xFF34B89B)),)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:4,bottom: 8),
            child: Align(
            alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width*.75,
                decoration: const ShapeDecoration(
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
    );
  }
}
