import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_template/models/qualifications.dart';

class QualificationsRepository {
  final FirebaseFirestore firebaseFirestore;
  QualificationsRepository({
    required this.firebaseFirestore,
  });

  Future<void> createQualifications(
      String id, String name, String college, String university) async {
    final qualDoc = firebaseFirestore.collection('qualifications').doc();
    final qual =
        Qualifications(name: name, college: college, university: university);
    final qualJson = qual.toJson();
    await qualDoc.set(qualJson);
  }

  Stream<List<Qualifications>> readQualifications() => firebaseFirestore
      .collection('qualifications')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((e) => Qualifications.fromJson(e.data())).toList());
}
