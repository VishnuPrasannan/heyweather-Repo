import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hey_weather/Screens/home_screen.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';
import 'package:shimmer/shimmer.dart';
import '../Utils/weather_utils.dart';
import '../Widgets/frosted_containers.dart';

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
            final cityName=data['city']['name'];
            final weatherDataList = data['list'][0];


            final currentWeather = weatherDataList['main']['temp'];
            final celsiusTemp = currentWeather - 273.15;
            final celsiusTempStr = celsiusTemp.toStringAsFixed(0);

            final currentSky = weatherDataList['weather'][0]['main'];
            final currentSkyDescription = weatherDataList['weather'][0]['description'];

            final maxTemp=weatherDataList['main']['temp_max'];
            final cMaxTemp=maxTemp-273.15;
            final celsiusMaxTempStr=cMaxTemp.toStringAsFixed(0);

            final minTemp=weatherDataList['main']['temp_min'];
            final cMinTemp=minTemp-273.15;
            final celsiusMinTempStr=cMinTemp.toStringAsFixed(0);

            final currentDayNightMode = weatherDataList['sys']['pod'];


            return Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Lp_bg.jpg'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Homepage()));
                    },
                    child: FrostedContainers(
                      theWidth: 500.0,
                      theHeight: 500.0,
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
                            Text(cityName,style: const TextStyle(
                                color: Colors.white, fontSize: 30),),

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
                             Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(FontAwesomeIcons.temperatureLow,color: Colors.yellow,),
                                    Text('Low:$celsiusMinTempStr', style:  TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    ),],
                                ),
                                HorizontalSizedBox(10),
                                Column(
                                  children: [
                                    Icon(FontAwesomeIcons.temperatureHigh,color: Colors.red,),
                                    Text('High:$celsiusMaxTempStr', style:  TextStyle(
                                        color: Colors.white, fontSize: 20),),
                                  ],
                                ),
                              ],
                            ),
                           VerticalSizedBox(40),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Homepage()));
                                      },
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.grey,
                                        child: const Text(
                                          'For More',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]);
          }),
    );
  }
}
