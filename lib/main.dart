import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlearner/provider/auth_provider.dart';
import 'package:onlearner/screens/Profile.dart';
import 'package:onlearner/screens/WelcomeScreen.dart';
import 'package:onlearner/screens/Authentication/profession_selection.dart';
import 'package:onlearner/screens/Authentication/select_cities.dart';
import 'package:onlearner/screens/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AuthProvider(), // Initialize your AuthProvider
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}


