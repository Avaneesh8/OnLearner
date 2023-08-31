import 'package:flutter/material.dart';
import 'package:onlearner/screens/student/HomePageStudent.dart';
import 'package:onlearner/screens/tutor/TutorHomePage.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return ap.userModel.profession == 'Tutor'
        ? HomeScreenStudent()
        :HomeScreenTutor();
  }
}
