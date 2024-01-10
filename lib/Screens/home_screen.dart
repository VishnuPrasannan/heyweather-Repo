import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hey_weather/Widgets/frosted_containers.dart';
import '../Utils/weather_utils.dart';
import '../Widgets/additional_info.dart';
import '../Widgets/horizontal_containers.dart';
import '../Widgets/sized_boxes.dart';

const Color primarycolor = Colors.white;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: FutureBuilder(
          future: WeatherUtil().getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.black54,
                ),
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

            final currentSky = weatherDataList['weather'][0]['main'];
            final currentSkyDescription = weatherDataList['weather'][0]['description'];

            final currentHumidity = weatherDataList['main']['humidity'];

            final currentWindSpeed = weatherDataList['wind']['speed'];
            final windSpeed = currentWindSpeed.toStringAsFixed(0);

            final currentPressure = weatherDataList['main']['pressure'];

            final currentVisiblity = weatherDataList['visibility'];
            final visibility = currentVisiblity / 1000;
            final visibilityStr = visibility.toStringAsFixed(0);

            final currentDayNightMode = weatherDataList['sys']['pod'];
            final feelsLike = weatherDataList['main']['feels_like'];
            final feelsLikeTEMP = feelsLike - 273.15;
            final feelsLikeTempStr = feelsLikeTEMP.toStringAsFixed(0);

            return Stack(children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(

                            //Broken Clouds
                            currentDayNightMode == 'n' &&
                                    currentSkyDescription == 'broken clouds'
                                ? 'assets/images/pure black background.jpg'
                                : currentDayNightMode == 'd' &&
                                        currentSkyDescription == 'broken clouds'
                                    ? 'assets/images/scattered day clouds.jpg'
                                    :

                                    //Scattered Clouds
                                    currentDayNightMode == 'd' &&
                                            currentSkyDescription ==
                                                'scattered clouds'
                                        ? 'assets/images/scattered daysky.jpg'
                                        : currentDayNightMode == 'n' &&
                                                currentSkyDescription ==
                                                    'scattered clouds'
                                            ? 'assets/images/scattered nightsky.jpg'
                                            :

                                            //Overcast clouds

                                            currentDayNightMode == 'd' &&
                                                    currentSkyDescription ==
                                                        'overcast clouds'
                                                ? 'assets/images/overcast day 2.jpg'
                                                : currentDayNightMode == 'n' &&
                                                        currentSkyDescription ==
                                                            'overcast clouds'
                                                    ? 'assets/images/night overcast clouds.jpg'
                                                    : 'assets/images/satellital view.jpg'

                            // Fewer Clouds

                            //clear sky

                            // Snow

                            //Rain

                            // light rain

                            ),
                        fit: BoxFit.cover)),
              ),

              Icon(
                currentSky == 'Clouds' || currentSky == 'Rain'
                    ? Icons.cloud
                    : Icons.sunny,
                color: primarycolor,
                size: 40,
              ),


            ]);
          }),
    );
  }
}
