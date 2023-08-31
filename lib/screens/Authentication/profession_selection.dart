import 'package:flutter/material.dart';
import 'package:onlearner/screens/Authentication/select_cities.dart';

class ProfessionSelection extends StatefulWidget {
  const ProfessionSelection({Key? key}) : super(key: key);

  @override
  State<ProfessionSelection> createState() => _ProfessionSelectionState();
}

class _ProfessionSelectionState extends State<ProfessionSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFF34B89B),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SelectCities(profession: 'Student')),
                );
              },
              child: Container(
                width: .5 * MediaQuery.of(context).size.width,
                height: .25 * MediaQuery.of(context).size.height,
                decoration: ShapeDecoration(
                  color: Color(0xD3FAC944),
                  shape: CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Student',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.63,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectCities(profession: 'Tutor')),
                );
              },
              child: Container(
                width: .5 * MediaQuery.of(context).size.width,
                height: .25 * MediaQuery.of(context).size.height,
                decoration: ShapeDecoration(
                  color: Color(0xD3FAC944),
                  shape: CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Tutor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.63,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
