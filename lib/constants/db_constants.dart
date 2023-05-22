import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('users');
final qualificationsRef =
    FirebaseFirestore.instance.collection('qualifications');
