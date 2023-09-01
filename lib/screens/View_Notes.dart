// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';

class ViewNotes extends StatefulWidget {
  final String pdfname;

  const ViewNotes({Key? key, required this.pdfname}) : super(key: key);

  @override
  State<ViewNotes> createState() => _ViewNotesState(pdfname: pdfname);
}

class _ViewNotesState extends State<ViewNotes> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];
  final String pdfname;

  _ViewNotesState({required this.pdfname});

  void getALLPdf() async {
    final results = await _firebaseFirestore.collection('pdfs').get();
    pdfData = results.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getALLPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF34B89B),
        title: const Center(
          child: Text("View Notes"),
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
      body: ListView.builder(
        itemCount: pdfData.length,
        itemBuilder: (context, index) {
          if (pdfData[index]['filename'] == pdfname) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PDFViewerScreen(pdfurl: pdfData[index]['url'])));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .12,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 201, 69, .83),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 4),
                        child: Row(

                          children: [
                            const Text("Name : "),
                            Text(pdfData[index]['Name']),
                          ],
                        ),
                      ),
                      // Add other rows/widgets as needed
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
                width: 0); // Return an empty container for other items
          }
        },
      ),
    );
  }
}

class PDFViewerScreen extends StatefulWidget {
  final String pdfurl;
  const PDFViewerScreen({Key? key, required this.pdfurl}) : super(key: key);

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  PDFDocument? document;
  void initialisedPdf() async {
    document = await PDFDocument.fromURL(widget.pdfurl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialisedPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: document != null
            ? PDFViewer(
                document: document!,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
