import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseReferences {
  CollectionReference restaurants, users;

  Firestore firestore;

  DatabaseReferences() {
    firestore = Firestore.instance;
    restaurants = firestore.collection('restaurants');
    users = firestore.collection('users');
  }
}
