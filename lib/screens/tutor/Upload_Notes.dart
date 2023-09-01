// ignore_for_file: file_names

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../widgets/drop_down_with_text.dart';
import '../Profile.dart';

class UploadNotes extends StatefulWidget {
  const UploadNotes({super.key});

  @override
  _UploadNotes createState() => _UploadNotes();
}

class _UploadNotes extends State<UploadNotes> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String?> uploadPdf(File file, String fileName) async {
    final refrence = FirebaseStorage.instance
        .ref()
        .child(selectedBoard)
        .child(selectedClass)
        .child(selectedSubject)
        .child(selectedChapter)
        .child('pdfs/$fileName');

    await refrence.putFile(file).whenComplete(() {});
    final downloadLink = refrence.getDownloadURL();

    return downloadLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null) {
      String filename =
          selectedBoard + selectedClass + selectedSubject + selectedChapter;
      String name=pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);

      final downloadlink = await uploadPdf(file, filename);

      await _firebaseFirestore.collection("pdfs").add({
        "filename": filename,
        "Name":name,
        "url": downloadlink,
      });

      Fluttertoast.showToast(
        msg: "PDF uploaded successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  String selectedBoard = 'CBSE';
  List<String> boardOptions = [
    'CBSE',
    'ICSE',
    'Andhra Pradesh Board',
    'Bihar Board',
    'Gujarat Board',
    'Karnataka Board',
    'Maharashtra Board',
    'Rajasthan Board',
    'Tamil Nadu Board',
    'West Bengal Board',
  ];
  String selectedClass = '1';
  List<String> classOptions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  String selectedSubject = 'Mathematics';
  List<String> subjectOptions = [
    'Mathematics',
    'Physics',
    'Chemistry',
    'Biology',
    'English',
    'History',
    'Geography',
    'Economics',
    'Computer Science',
    'Accountancy',
    'Business Studies',
    'Others'
  ];
  String selectedChapter = '1';
  List<String> chapterOptions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF34B89B),
        title: const Center(
          child: Text("Upload Notes"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            DropdownWithText(
              selectedValue: selectedBoard,
              options: boardOptions,
              labelText: 'Selected Board',
              onChanged: (newValue) {
                setState(() {
                  selectedBoard = newValue!;
                });
              },
            ),
            DropdownWithText(
              selectedValue: selectedClass,
              options: classOptions,
              labelText: 'Selected Class',
              onChanged: (newValue) {
                setState(() {
                  selectedClass = newValue!;
                });
              },
            ),
            DropdownWithText(
              selectedValue: selectedSubject,
              options: subjectOptions,
              labelText: 'Selected Subjects',
              onChanged: (newValue) {
                setState(() {
                  selectedSubject = newValue!;
                });
              },
            ),
            DropdownWithText(
              selectedValue: selectedChapter,
              options: chapterOptions,
              labelText: 'Selected Chapter',
              onChanged: (newValue) {
                setState(() {
                  selectedChapter = newValue!;
                });
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                onPressed: pickFile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(250, 201, 69, .83),
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.upload),
                    SizedBox(width: 8),
                    Text(
                      "Upload",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
