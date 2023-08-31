import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/auth_provider.dart';
import 'Profile.dart';

class HomeTutor extends StatefulWidget {
  const HomeTutor({Key? key}) : super(key: key);

  @override
  State<HomeTutor> createState() => _HomeTutorState();
}

class _HomeTutorState extends State<HomeTutor> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final String HomeTutorCity = ap.userModel.city;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where(
          'city',
          isEqualTo: HomeTutorCity,
        )
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34B89B),
        title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text("Home tutor"),
              ],
            )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height*.12,
                          width: MediaQuery.of(context).size.width,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(color:Color.fromRGBO(250, 201, 69, .83),borderRadius: BorderRadius.circular(12),),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left:12.0,bottom: 4),
                                child: Row(
                                  children: [
                                    Text("Name : "),
                                    Text(snapshot.data!.docChanges[index].doc['name'],),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  //launch('tel${snapshot.data!.docChanges[index].doc['phoneNumber']}');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left:12.0,bottom: 4),
                                  child: Row(
                                    children: [
                                      Text("Phone Number: "),
                                      Text(snapshot.data!.docChanges[index].doc['phoneNumber'],),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:12.0,bottom: 4),
                                child: Row(
                                  children: [
                                    Text("Class: "),
                                    Text(snapshot.data!.docChanges[index].doc['Class'],),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:12.0,bottom: 4),
                                child: Row(
                                  children: [
                                    Text("Subject: "),
                                    Text(snapshot.data!.docChanges[index].doc['subject'],),
                                  ],
                                ),
                              ),

                            ],
                          )
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
