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

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                    centerTitle: true,
                    backgroundColor: Colors.black54,
                    expandedHeight: 150,
                    floating: false,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                        title: Row(
                      children: [
                        const Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        const HorizontalSizedBox(20),
                        Text(
                          '$cityName',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20, child: VerticalDivider()),
                        Text('$celsiusTempStr °')
                      ],
                    ))),

                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    height: 1500,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Lp_bg.jpg'),
                            fit: BoxFit.cover)
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //
                        //         //Broken Clouds
                        //         currentDayNightMode == 'n' &&
                        //                 currentSkyDescription == 'broken clouds'
                        //             ? 'assets/images/pure black background.jpg'
                        //             : currentDayNightMode == 'd' &&
                        //                     currentSkyDescription ==
                        //                         'broken clouds'
                        //                 ? 'assets/images/scattered day clouds.jpg'
                        //                 :
                        //
                        //                 //Scattered Clouds
                        //                 currentDayNightMode == 'd' &&
                        //                         currentSkyDescription ==
                        //                             'scattered clouds'
                        //                     ? 'assets/images/scattered daysky.jpg'
                        //                     : currentDayNightMode == 'n' &&
                        //                             currentSkyDescription ==
                        //                                 'scattered clouds'
                        //                         ? 'assets/images/scattered nightsky.jpg'
                        //                         :
                        //
                        //                         //Overcast clouds
                        //
                        //                         currentDayNightMode == 'd' &&
                        //                                 currentSkyDescription ==
                        //                                     'overcast clouds'
                        //                             ? 'assets/images/overcast day 2.jpg'
                        //                             : currentDayNightMode ==
                        //                                         'n' &&
                        //                                     currentSkyDescription ==
                        //                                         'overcast clouds'
                        //                                 ? 'assets/images/night overcast clouds.jpg'
                        //                                 : 'assets/images/satellital view.jpg'
                        //
                        //         // Fewer Clouds
                        //
                        //         //clear sky
                        //
                        //         // Snow
                        //
                        //         //Rain
                        //
                        //         // light rain
                        //
                        //         ),
                        //     fit: BoxFit.cover)
                        ),
                    child: Column(
                      children: [
                        const VerticalSizedBox(20),
                        const FrostedContainers(
                          theWidth: 400.0,
                          theHeight: 100.0,
                        ),
                        const VerticalSizedBox(20),
                        const FrostedContainers(
                          theHeight: 400.0,
                          theWidth: 400.0,
                        ),
                        const VerticalSizedBox(20),
                        const FrostedContainers(
                          theWidth: 390.0,
                          theHeight: 50.0,
                        ),
                        const VerticalSizedBox(20),
                        Row(
                          children: [
                            const HorizontalSizedBox(30),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  FrostedContainers(
                                    theWidth: 200.0,
                                    theHeight: 150.0,
                                    theChild: Addinfo(
                                        icons: Icons.water_drop_outlined,
                                        text: '$currentHumidity %',
                                        maintext: 'Humidity',
                                        iconSize: 25,
                                        textSize: 20,
                                        mainTextSize: 20),
                                  ),
                                  FrostedContainers(
                                    theWidth: 200.0,
                                    theHeight: 150.0,
                                    theChild: Addinfo(
                                        icons: FontAwesomeIcons.wind,
                                        text: '$windSpeed mi',
                                        maintext: 'Wind Speed',
                                        iconSize: 25,
                                        textSize: 20,
                                        mainTextSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const HorizontalSizedBox(10),
                            Column(
                              children: [
                                FrostedContainers(
                                  theWidth: 200.0,
                                  theHeight: 150.0,
                                  theChild: Addinfo(
                                      icons: Icons.remove_red_eye_outlined,
                                      text: '$visibilityStr km/h',
                                      maintext: 'Visibility',
                                      iconSize: 25,
                                      textSize: 20,
                                      mainTextSize: 20),
                                ),
                                FrostedContainers(
                                  theWidth: 200.0,
                                  theHeight: 150.0,
                                  theChild: Addinfo(
                                      icons: Icons.compress,
                                      text: '$currentPressure hpa',
                                      maintext: 'Air Pressure',
                                      iconSize: 25,
                                      textSize: 20,
                                      mainTextSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          child: FrostedContainers(
                            theWidth: 300.0,
                            theHeight: 180.0,
                            theChild: Addinfo(
                                icons: FontAwesomeIcons.temperatureHalf,
                                text: '$feelsLikeTempStr °',
                                maintext: 'Feels Like',
                                iconSize: 25,
                                textSize: 20,
                                mainTextSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ]))
              ],
            );
          }),
    );
  }
}
