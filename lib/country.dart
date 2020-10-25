import 'dart:ffi';

import 'package:flutter/material.dart';

class Country {
  Country(
      {this.name,
      this.flag,
      this.confirmed,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.lat,
      this.lon});

  final String name;
  final String flag;
  final int confirmed;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final double lat;
  final double lon;
}
