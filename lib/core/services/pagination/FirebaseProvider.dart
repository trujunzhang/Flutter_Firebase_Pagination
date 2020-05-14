import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
//  Future<List<DocumentSnapshot>> fetchFirstList(String query) async {
  Future<List<DocumentSnapshot>> fetchFirstList( String query ) async {
    // String query = "Forno Vecchio";
    // String query = "Pez";
    return (await Firestore.instance
            .collection("restaurants")
            .orderBy("displayName")
//            .where("displayName", arrayContains: query)
//        .where("displayName", arrayContainsAny: [query])
        .where("displayName", isGreaterThanOrEqualTo: query.toUpperCase())
      //  .limit(2)
            .getDocuments())
        .documents;
  }

  Future<List<DocumentSnapshot>> fetchNextList(
  List<DocumentSnapshot> documentList, String query ) async {
    // String query = "a";
    return (await Firestore.instance
            .collection("restaurants")
            .orderBy("displayName")
        .where("displayName", isGreaterThanOrEqualTo: query.toUpperCase())
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(2)
            .getDocuments())
        .documents;
  }
}
