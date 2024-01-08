import 'package:flutter/material.dart';
<<<<<<<<< Temporary merge branch 1
import '../Widgets/frosted_containers.dart';
import 'home_screen.dart';

=========
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hey_weather/Screens/home_screen.dart';
import 'package:hey_weather/Widgets/additional_info.dart';
import 'package:hey_weather/Widgets/sample_add_info.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';
import '../Utils/weather_utils.dart';
import '../Widgets/frosted_containers.dart';
>>>>>>>>> Temporary merge branch 2

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<<<< Temporary merge branch 1
    return Stack(children: [
      Opacity(
        opacity: 0.6,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Lp_bg.jpg'),
                  fit: BoxFit.cover)),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: FrostedContainers(
            theWidth: 350.0,
            theHeight: 450.0,
            theChild: Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Homepage()));
                      },
                      child: const Text(
                        'click here',
                        style: TextStyle(color: Colors.white),
                      )),
                  const Text('H',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
        ),
      )]);
=========
    return FutureBuilder(
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
            Opacity(
              opacity: 0.6,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Lp_bg.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: FrostedContainers(
                  theWidth: 400.0,
                  theHeight: 450.0,
                  theChild: Center(
                    child: Column(
                      children: [
                        const VerticalSizedBox(30),
                        Icon(
                          currentSky == 'Clouds'
                              ? Icons.cloud
                              : currentSky == 'Rain'
                                  ? FontAwesomeIcons.cloudShowersHeavy
                                  : FontAwesomeIcons.sun,
                          color: primarycolor,
                          size: 120,
                        ),
                        const VerticalSizedBox(20),

                        Text(
                          '$celsiusTempStr°',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 90),
                        ),
                        Text(
                          currentSkyDescription,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),



                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Icon(Icons.air, color: primarycolor),
                                  const VerticalSizedBox(5),
                                  Text(
                                    '$windSpeed km/h',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  const VerticalSizedBox(5),
                                  const Text(
                                    'Wind Speed',
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 15),
                                  )
                                ],
                              ),
                              const HorizontalSizedBox(15),
                              SampleAddInfo(
                                  theIcon: FontAwesomeIcons.temperatureHalf,
                                  theIconColor: primarycolor,
                                  theValue: '$feelsLikeTempStr°',
                                  theText: 'Feels Like'),
                              const HorizontalSizedBox(15),
                              SampleAddInfo(
                                  theIcon: Icons.water_drop_outlined,
                                  theIconColor: primarycolor,
                                  theValue: '$currentHumidity %',
                                  theText: 'Humidity')
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Homepage()));
                                  },
                                  child: const Text(
                                    'For More',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]);
        });
>>>>>>>>> Temporary merge branch 2
  }
}
