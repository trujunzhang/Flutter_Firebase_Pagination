import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ieatta/src/bloc/bloc.dart';

import 'search_bar_ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieListBloc movieListBloc;

  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieListBloc = MovieListBloc();
    movieListBloc.fetchFirstList();
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var streamBuilder = StreamBuilder<List<DocumentSnapshot>>(
      stream: movieListBloc.movieStream,
      builder: (context, snapshot) {
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
                    leading: CircleAvatar(
                        child: Text(
                            snapshot.data[index]["displayName"].toString())),
                    title: Text(snapshot.data[index]["address"]),
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
      movieListBloc.fetchNextMovies();
    }
  }

  void nextPageClick() {
    movieListBloc.fetchNextMovies();
  }

  void refreshPageClick() {
    movieListBloc.fetchFirstList();
  }

  void searchChangedText(String text) {}
}
