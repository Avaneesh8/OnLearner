import 'package:flutter/material.dart';

import 'Login.dart';
import 'SignUp.dart';

class MinimalistLogin extends StatelessWidget {
  const MinimalistLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.15,
                    ),
                    Image(width: 250, image: AssetImage('images/onlearner_whitelogo.png')),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,bottom: 10),

              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Get Started.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF34B89B),
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.63,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,bottom: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width*.55,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFC4C4C4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.1,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.75,
                height: MediaQuery.of(context).size.height*.05,
                decoration: ShapeDecoration(
                  color: Color(0xFF6FCBB9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.63,
                    ),
                  ),
                ),
              ),
            ),SizedBox(
              height: MediaQuery.of(context).size.height*.05,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.75,
                height: MediaQuery.of(context).size.height*.05,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF34B89B)),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6FCBB9),
                      fontSize: 20,
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
