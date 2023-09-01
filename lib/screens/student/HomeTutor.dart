// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../Profile.dart';

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
        ).where('profession',
      isEqualTo: 'Tutor',)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF34B89B),
        title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

                Text("Home tutor"),
              ],
            )),
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
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height*.12,
                          width: MediaQuery.of(context).size.width,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(color:const Color.fromRGBO(250, 201, 69, .83),borderRadius: BorderRadius.circular(12),),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left:12.0,bottom: 4),
                                child: Row(
                                  children: [
                                    const Text("Name : "),
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
                                      const Text("Phone Number: "),
                                      Text(snapshot.data!.docChanges[index].doc['phoneNumber'],),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:12.0,bottom: 4),
                                child: Row(
                                  children: [
                                    const Text("Class: "),
                                    Text(snapshot.data!.docChanges[index].doc['Class'],),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:12.0,bottom: 4),
                                child: Row(
                                  children: [
                                    const Text("Subject: "),
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
