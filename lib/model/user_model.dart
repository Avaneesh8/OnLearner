// ignore_for_file: non_constant_identifier_names

class UserModel {
  String name;
  String Class;
  String description;
  String Subject;
  String createdAt;
  String phoneNumber;
  String uid;
  String city;
  String profession;

  UserModel({
    required this.name,
    required this.Class,
    required this.description,
    required this.Subject,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
    required this.city,
    required this.profession,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      Class: map['Class'] ?? '',
      description: map['description'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
      Subject: map['subject'] ?? '',
      city: map['city']??'',
      profession: map['profession'],
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "uid": uid,
      "Class": Class,
      "subject": Subject,
      "phoneNumber": phoneNumber,
      "created At": createdAt,
      "city":city,
      "profession":profession,
    };
  }
}
