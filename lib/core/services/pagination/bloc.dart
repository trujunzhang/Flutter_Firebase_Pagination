import 'dart:async';
import 'dart:io';

import 'package:ieatta/src/appModels/models/Restaurants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_path.dart';
import '../firestore_service.dart';
import 'FirebaseProvider.dart';

class MovieListBloc {
  final _firestoreService = FirestoreService.instance;

  FirebaseProvider firebaseProvider;

  List<DocumentSnapshot> documentList;

  BehaviorSubject<List<ParseModelRestaurants>> movieController;

  bool showIndicator = false;
  BehaviorSubject<bool> showIndicatorController;

  MovieListBloc() {
    movieController = BehaviorSubject<List<ParseModelRestaurants>>();
    showIndicatorController = BehaviorSubject<bool>();
    firebaseProvider = FirebaseProvider();
  }

  Stream get getShowIndicatorStream => showIndicatorController.stream;

  Stream<List<ParseModelRestaurants>> get movieStream => movieController.stream;

/*This method will automatically fetch first 10 elements from the document list */
  Future fetchFirstList(String search) async {
    try {
      List<ParseModelRestaurants> list = await _firestoreService.collectionList(
        path: FBCollections.Restaurants,
        queryBuilder: (Query query) {
          return query
              .where("displayName",
                  isGreaterThanOrEqualTo: search.toUpperCase())
              .limit(2);
        },
        builder: (data, documentId) =>
            ParseModelRestaurants.fromMap(data, documentId),
      );

      print(list);
      movieController.sink.add(list);
      try {
        if (documentList.length == 0) {
          movieController.sink.addError("No Data Available");
        }
      } catch (e) {}
    } on SocketException {
      movieController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      movieController.sink.addError(e);
    }
  }

/*This will automatically fetch the next 10 elements from the list*/
  fetchNextMovies(String search) async {
    try {
      updateIndicator(true);
      List<ParseModelRestaurants> list = await _firestoreService.collectionList(
        path: FBCollections.Restaurants,
        queryBuilder: (Query query) {
          return query
              .where("displayName",
              isGreaterThanOrEqualTo: search.toUpperCase())
              .startAfterDocument(documentList[documentList.length - 1])
              .limit(2);
        },
        builder: (data, documentId) =>
            ParseModelRestaurants.fromMap(data, documentId),
      );

      print(list);
      movieController.sink.add(list);

//      List<DocumentSnapshot> newDocumentList =
//          await firebaseProvider.fetchNextList(documentList, query);
//      documentList.addAll(newDocumentList);
//      movieController.sink.add(documentList);
      try {
        if (documentList.length == 0) {
          movieController.sink.addError("No Data Available");
          updateIndicator(false);
        }
      } catch (e) {
        updateIndicator(false);
      }
    } on SocketException {
      movieController.sink.addError(SocketException("No Internet Connection"));
      updateIndicator(false);
    } catch (e) {
      updateIndicator(false);
      print(e.toString());
      movieController.sink.addError(e);
    }
  }

/*For updating the indicator below every list and paginate*/
  updateIndicator(bool value) async {
    showIndicator = value;
    showIndicatorController.sink.add(value);
  }

  void dispose() {
    movieController.close();
    showIndicatorController.close();
  }
}
