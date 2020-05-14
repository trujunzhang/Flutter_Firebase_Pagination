import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'firestore_path.dart';

/*
This class represent all possible CRUD operation for Firestore.
It contains all generic implementation needed based on the provided document
path and documentID,since most of the time in Firestore design, we will have
documentID and path for any document and collections.
 */
class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  Future<void> setData({
    @required FBCollections path,
    @required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = Firestore.instance.document(fbCollectionToString(path));
    print('$path: $data');
    await reference.setData(data, merge: merge);
  }

  Future<void> bulkSet({
    @required FBCollections path,
    @required List<Map<String, dynamic>> datas,
    bool merge = false,
  }) async {
//    final reference = Firestore.instance.document(path);
//    final batchSet = Firestore.instance.batch();

    print('$path: $datas');
  }

  Future<void> deleteData({@required FBCollections path}) async {
    final reference = Firestore.instance.document(fbCollectionToString(path));
    print('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    @required FBCollections path,
    @required T builder(Map<String, dynamic> data, String documentID),
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = Firestore.instance.collection(fbCollectionToString(path));
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data, snapshot.documentID))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Future<List<T>> collectionList<T>({
    @required FBCollections path,
    @required T builder(Map<String, dynamic> data, String documentID),
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) async {
    Query query = Firestore.instance.collection(fbCollectionToString(path));
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    var snapshot = await query.getDocuments();
    List<T> result = snapshot.documents
        .map((snapshot) => builder(snapshot.data, snapshot.documentID))
        .where((value) => value != null)
        .toList();
    if (sort != null) {
      result.sort(sort);
    }
    return result;
  }

  Stream<T> documentStream<T>({
    @required FBCollections path,
    @required T builder(Map<String, dynamic> data, String documentID),
  }) {
    final DocumentReference reference =
        Firestore.instance.document(fbCollectionToString(path));
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => builder(snapshot.data, snapshot.documentID));
  }
}
