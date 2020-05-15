import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ieatta/core/services/pagination/restaurants.dart';
import 'package:ieatta/src/appModels/models/Restaurants.dart';

import 'search_bar_ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantsPagination movieListBloc = RestaurantsPagination();
  String query = "";

// String query ="fo";
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    movieListBloc.fetchFirstList(query);
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var streamBuilder = StreamBuilder<List<ParseModelRestaurants>>(
      stream: movieListBloc.movieStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          var x = 0;
        }
        if (snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            shrinkWrap: true,
            controller: controller,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(snapshot.data[index].displayName),
                    subtitle: Text(snapshot.data[index].address),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase firestore pagination"),
        ),
        body: Column(
          children: <Widget>[
            SearchBarUI(
                nextPageClick: nextPageClick,
                refreshPageClick: refreshPageClick,
                searchChangedText: searchChangedText),
            streamBuilder,
          ],
        ));
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      // movieListBloc.fetchNextMovies();
    }
  }

  void nextPageClick() {
    movieListBloc.fetchNextMovies(query);
  }

  void refreshPageClick() {
    movieListBloc.fetchFirstList(query);
  }

  void searchChangedText(String text) {
    query = text;
    movieListBloc.fetchFirstList(text);
  }
}
