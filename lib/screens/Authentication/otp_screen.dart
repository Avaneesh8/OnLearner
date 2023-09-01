import 'package:flutter/material.dart';
import 'package:onlearner/provider/auth_provider.dart';
import 'package:onlearner/screens/home.dart';
import 'package:onlearner/screens/Authentication/profession_selection.dart';
import 'package:onlearner/utils/utils.dart';
import 'package:onlearner/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String number;
  const OtpScreen({super.key, required this.verificationId,required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;

    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFA18030),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .08,
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 35, bottom: 30),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Enter the OTP',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xFFA18030),
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.63,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35, bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .45,
                                decoration: const ShapeDecoration(
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
                          Container(
                            width: 200,
                            height: 200,
                            padding: const EdgeInsets.all(20.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "images/otp_screen.png",
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Verification",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Enter the OTP send to your phone number",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Pinput(
                            length: 6,
                            showCursor: true,
                            defaultPinTheme: PinTheme(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0, // Shadow offset
                                  ),
                                ],
                                color: const Color(0xFFCEE5D0),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFFCEE5D0),
                                ),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onCompleted: (value) {
                              setState(() {
                                otpCode = value;
                              });
                            },
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: CustomButton(
                              text: "Verify",
                              onPressed: () {
                                if (otpCode != null) {
                                  verifyOtp(context, otpCode!);
                                } else {
                                  showSnackBar(context, "Enter 6-Digit code");
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Didn't receive any code?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              sendPhoneNumber();
                            },
                            child: const Text(
                              "Resend New Code",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(250, 201, 69, .83),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfessionSelection()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.signInWithPhone2(context, widget.number);
  }
}

