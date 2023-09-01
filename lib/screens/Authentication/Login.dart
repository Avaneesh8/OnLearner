// ignore_for_file: file_names

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController age = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .12,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, bottom: 30),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome!!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF34B89B),
                    fontSize: 55,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.63,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: .1 * MediaQuery.of(context).size.height,
            ),
            SizedBox(
              width: .25 * MediaQuery.of(context).size.width,
              height: .1 * MediaQuery.of(context).size.height,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color.fromRGBO(161, 128, 48, 1),
                    fontSize: 35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: TextFormField(
                cursorColor: Colors.black,
                controller: phoneController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
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
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 9
                      ? Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: InkWell(
                onTap: () => sendPhoneNumber(),
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
                    style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}
