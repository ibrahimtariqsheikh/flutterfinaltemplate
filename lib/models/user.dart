import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String firstname;
  final String lastname;
  final String gender;
  final String email;

  const User({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.email,
  });

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      id: userData!['id'],
      username: userData['username'],
      firstname: userData['firstname'],
      lastname: userData['lastname'],
      gender: userData['gender'],
      email: userData['email'],
    );
  }

  factory User.initial() {
    return const User(
      id: '',
      username: '',
      firstname: '',
      lastname: '',
      gender: '',
      email: '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "email": email,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      username,
      firstname,
      lastname,
      gender,
      email,
    ];
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      gender: json['gender'],
      email: json['email'],
    );
  }

  User copyWith({
    String? id,
    String? username,
    String? firstname,
    String? lastname,
    String? gender,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      gender: gender ?? this.gender,
      email: email ?? this.email,
    );
  }
}
