import 'package:flutter/material.dart';

class SearchBarUI extends StatefulWidget {
  SearchBarUI(
      {Key key,
      this.nextPageClick,
      this.refreshPageClick,
      this.searchChangedText})
      : super(key: key);

  final Function nextPageClick;
  final Function refreshPageClick;
  final Function searchChangedText;

  @override
  _SearchBarUIState createState() => _SearchBarUIState();
}

class _SearchBarUIState extends State<SearchBarUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  widget.refreshPageClick();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
//                      Icons.gps_fixed,
                      Icons.gps_not_fixed,
                      size: 20,
//                      color: Colors.blue
                      color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    onChanged: (String txt) {
                      widget.searchChangedText(txt);
                    },
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'London...',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  widget.nextPageClick();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
//                      Icons.gps_fixed,
                      Icons.next_week,
                      size: 20,
//                      color: Colors.blue
                      color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
