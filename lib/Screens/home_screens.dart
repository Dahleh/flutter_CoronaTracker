import 'package:flutter/material.dart';
import 'package:menuapp/Network/numbers.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:menuapp/country.dart';
import 'package:menuapp/Component/imagegrid.dart';
import 'package:menuapp/Component/navbar.dart';

List<Country> list = [];
List<Country> _searchList = [];
int worldCases = 0;
int worldRecovered = 0;
int worldDeaths = 0;
bool showSpinner = false;

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  numberModel data = numberModel();
  int selectedIndex = 0;
  Widget appBarTitle = Text(
    "Home",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  bool _IsSearching;
  String _searchText = "";
  _HomeScreenState() {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  Future updateUI() async {
    showSpinner = true;
    var weatherData = await data.getAllNumbers('countries');
    var worldData = await data.getWorldNumbers('all');
    list.clear();
    setState(() {
      for (var item in weatherData) {
        Country country = Country(
          name: item['country'],
          flag: item['countryInfo']['flag'],
          confirmed: item['cases'],
          todayCases: item['todayCases'],
          deaths: item['deaths'],
          todayDeaths: item['todayDeaths'],
          recovered: item['recovered'],
          todayRecovered: item['todayRecovered'],
          active: item['active'],
          critical: item['critical'],
        );
        if (country.name == 'Israel') {
          continue;
        }
        list.add(country);
      }
      worldCases = worldData['cases'];
      worldRecovered = worldData['recovered'];
      worldDeaths = worldData['deaths'];
    });
    _searchList = list;
    showSpinner = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: buildBar(context),
      bottomNavigationBar: Hero(
        tag: "Nav",
              child: NavBar(
          selectedIndex: 0,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          child: GridView.builder(
              itemCount: _searchList.length,
              itemBuilder: (context, index) {
                return ImageGrid(
                  text: _searchList[index].name,
                  flag: _searchList[index].flag,
                  confirmed: _searchList[index].confirmed,
                  active: _searchList[index].active,
                  critical: _searchList[index].critical,
                  deaths: _searchList[index].deaths,
                  recovered: _searchList[index].recovered,
                  todayRecovered: _searchList[index].todayRecovered,
                  todayDeaths: _searchList[index].todayDeaths,
                  todayCases: _searchList[index].todayCases,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              )),
        ),
      ),
    );
  }

  Widget buildBar(BuildContext context) {
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
