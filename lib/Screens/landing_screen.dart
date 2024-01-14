import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/decorations.dart';
import '../Widgets/frosted_containers.dart';
import 'home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';
import '../Utils/weather_utils.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            final cityName = data['city']['name'];
            final weatherDataList = data['list'][0];

            final minTemp = weatherDataList['main']['temp_min'];
            final celsiusMin = minTemp - 273.15;
            final celsiusMinStr = celsiusMin.toStringAsFixed(0);

            final maxTemp = weatherDataList['main']['temp_max'];
            final celsiusMax = maxTemp - 273.15;
            final celsiusMaxStr = celsiusMax.toStringAsFixed(0);

            final currentWeather = weatherDataList['main']['temp'];
            final celsiusTemp = currentWeather - 273.15;
            final celsiusTempStr = celsiusTemp.toStringAsFixed(0);

            final currentSky = weatherDataList['weather'][0]['main'];
            final currentSkyDescription =
                weatherDataList['weather'][0]['description'];

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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Lp_bg.jpg'),
                        fit: BoxFit.cover)),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Homepage()));
                  },
                  child: FrostedContainers(
                    theHeight: 550.0,
                    theWidth: 350.0,
                    theChild: Column(
                      children: [
                        const VerticalSizedBox(20),
                        Icon(
                          currentSky == 'Clouds'
                              ? Icons.cloud
                              : currentSky == 'Rain'
                                  ? FontAwesomeIcons.cloudShowersHeavy
                                  : Icons.sunny,
                          color: primarycolor,
                          size: 100,
                        ),
                        const VerticalSizedBox(20),
                        Decorations(
                            apiText: cityName,
                            apiTextFontSize: 30.0,
                            icon: FontAwesomeIcons.cloudSunRain,
                            iconSize: 30.0),
                        Row(
                          children: [
                            const HorizontalSizedBox(20),
                            const Icon(
                              FontAwesomeIcons.cloud,
                              color: Colors.white54,
                              size: 40,
                            ),
                            const HorizontalSizedBox(60),
                            Text(
                              '$celsiusTempStr°',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 90),
                            ),
                          ],
                        ),

                        //Frosted Container DECORATIONS
                        Decorations(
                            apiText: currentSkyDescription,
                            apiTextFontSize: 25.0,
                            icon: FontAwesomeIcons.cloudRain,
                            iconSize: 40.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/low temperature.png',
                                  height: 50,
                                  width: 70,
                                ),
                                Text(
                                  'L: $celsiusMinStr°',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            const HorizontalSizedBox(70),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/hot temperature.png',
                                  height: 50,
                                  width: 70,
                                ),
                                Text(
                                  'H: $celsiusMaxStr°',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        const VerticalSizedBox(20),

                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Homepage()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Your Daily Forecast',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_right_outlined,
                                  color: Colors.white,
                                )
                              ],
                            )),

                        const SizedBox(
                            width: 300,
                            child: Divider(height: 10, color: Colors.white54)),
                      ],
                    ),
                  ),
                ),
              )
            ]);
          }),
    );
  }
}
