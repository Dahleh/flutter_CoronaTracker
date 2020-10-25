import 'package:flutter/material.dart';
import 'package:menuapp/country.dart';

List<Country> list = [];
List<Country> _searchList = [];

class buildBar extends StatefulWidget {
  @override
  _buildBarState createState() => _buildBarState();
}

class _buildBarState extends State<buildBar> {
  Widget appBarTitle = Text(
    "Home",
    style: TextStyle(color: Colors.white),
  );
  bool _IsSearching;
  String _searchText = "";
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  List<Country> _buildList() {
    return list; //_list.map((contact) =>  Uiitem(contact)).toList();
  }

  List<Country> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList =
          list; //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
      _searchList = list
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('jadhjshdjshd${_searchList.length}');
      return _searchList;
    }
  }

  _buildBarState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: appBarTitle,
        //iconTheme: IconThemeData(color: Colors.black45),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "Search here..",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "Home",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}
