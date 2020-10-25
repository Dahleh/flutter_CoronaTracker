import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:menuapp/Network/numbers.dart';
import 'package:menuapp/country.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:menuapp/Component/navbar.dart';

List<Country> list = [];
bool showSpinner = false;
final List<LatLng> markerLocations = [];

class MapsScreen extends StatefulWidget {
  static const String id = "maps_screen";
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  int selectedIndex = 0;
  Set<Marker> markers = Set();
  numberModel data = numberModel();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.7041, 77.1025),
    zoom: 3.0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  Future updateUI() async {
    showSpinner = true;
    var weatherData = await data.getAllNumbers('countries');

    setState(() {
      for (var item in weatherData) {
        Country country = Country(
          name: item['country'],
          confirmed: item['cases'],
          lat: item['countryInfo']['lat'].toDouble(),
          lon: item['countryInfo']['long'].toDouble(),
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
        Marker resultMarker = Marker(
          markerId: MarkerId(country.name),
          infoWindow: InfoWindow(
              title: "${country.name}",
              snippet:
                  "Confirmed: ${country.confirmed} Today cases: ${country.todayCases}"),
          position: LatLng(country.lat.toDouble(), country.lon.toDouble()),
        );
        markers.add(resultMarker);
      }
    });
    showSpinner = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: GoogleMap(
          mapToolbarEnabled: false,
          markers: markers,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 1,
      ),
    );
  }
}
