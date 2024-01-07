import 'package:flutter/material.dart';
import '../Utils/weather_utils.dart';
class TemperatureData extends StatefulWidget {

  const TemperatureData({super.key,});

  @override
  State<TemperatureData> createState() => _TemperatureDataState();
}

class _TemperatureDataState extends State<TemperatureData> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:WeatherUtil().getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: LinearProgressIndicator(color: Colors.blue,),
                )
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;
          final weatherDataList = data['list'][0];

          final currentWeather = weatherDataList['main']['temp'];
          final celsiusTemp = currentWeather - 273.15;
          final celsiusTempStr = celsiusTemp.toStringAsFixed(0);
          return Center(child: Text('$celsiusTempStr'));
        });
  }}
