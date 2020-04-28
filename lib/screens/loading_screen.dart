import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;

const apikey = 'c981cc5362ed9be6a6ac958a129aed21';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  void getData() async {
    htpp.Response response = await htpp.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var decodeData = jsonDecode(data);
      String description = decodeData['weather'][0]['description'];
      var temperature = decodeData['main']['temp'];
      var name = decodeData['main'];
      print(description);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
