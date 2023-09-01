import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/drop_down_with_text.dart';
import 'Profile.dart';
import 'View_Notes.dart';

class DownloadNotes extends StatefulWidget {
  const DownloadNotes({Key? key}) : super(key: key);

  @override
  State<DownloadNotes> createState() => _DownloadNotesState();
}

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
List<Map<String, dynamic>> pdfData = [];

class _DownloadNotesState extends State<DownloadNotes> {
  //String name =
  //  selectedBoard + selectedClass + selectedSubject + selectedChapter;
  String selectedBoard = 'CBSE';
  List<String> boardOptions = [
    'CBSE',
    'ICSE',
    'Uttar Pradesh',
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
          child: Text("Download Notes"),
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1),
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
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewNotes(
                        pdfname:
                            '$selectedBoard$selectedClass$selectedSubject$selectedChapter',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(250, 201, 69, .83),
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.download),
                    SizedBox(width: 8),
                    Text(
                      "Download",
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
