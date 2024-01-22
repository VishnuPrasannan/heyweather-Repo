import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hey_weather/Widgets/api_key.dart';

class WeatherUtil{
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {

      String cityName = 'Aluva';

      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'));
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}