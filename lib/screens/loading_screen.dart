import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '7725f062e48ef76a27f04fb0bd096a41';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longtitude;
  late double latitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtitude = location.longtitude;
    await getData();
  }

   getData() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=33&lon=139&appid=$apiKey'));
        
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];

      print(temperature);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
