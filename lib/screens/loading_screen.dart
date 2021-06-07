import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    if (weatherData != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));
    }
    if (weatherData == null) {
      errorScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return loadingScreen();
  }

  Widget loadingScreen() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.white,
              size: 70,
            ),
            SizedBox(height: 20),
            Text(
              'Loading, please wait...',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget errorScreen() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Check internet'),
        ),
      ),
    );
  }
}
