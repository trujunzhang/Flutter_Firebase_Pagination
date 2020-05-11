import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  Future<List<DocumentSnapshot>> fetchFirstList() async {
    return (await Firestore.instance
            .collection("restaurants")
            .orderBy("displayName")
            .limit(2)
            .getDocuments())
        .documents;
  }

  Future<List<DocumentSnapshot>> fetchNextList(
      List<DocumentSnapshot> documentList) async {
    return (await Firestore.instance
            .collection("restaurants")
            .orderBy("displayName")
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(2)
            .getDocuments())
        .documents;
  }
}
