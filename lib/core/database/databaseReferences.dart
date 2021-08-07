import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseReferences {
  CollectionReference restaurants, users;

  FirebaseFirestore firestore;

  DatabaseReferences() {
    firestore = FirebaseFirestore.instance;
    restaurants = firestore.collection('restaurants');
    users = firestore.collection('users');
  }
}
