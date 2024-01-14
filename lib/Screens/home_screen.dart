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
                const SliverAppBar(
                    backgroundColor: Colors.black54,
                    expandedHeight: 200,
                    floating: false,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Kochi'),
                    )),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    height: double.maxFinite,
                    decoration: const BoxDecoration(color: Colors.yellow
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
                    child: const Column(
                      children: [
                        VerticalSizedBox(20),
                        FrostedContainers(
                          theWidth: 400.0,
                          theHeight: 100.0,
                        ),
                        VerticalSizedBox(20),
                        FrostedContainers(
                          theHeight: 400.0,
                          theWidth: 400.0,
                        ),
                        VerticalSizedBox(20),
                        FrostedContainers(
                          theWidth: 375.0,
                          theHeight: 50.0,
                        ),
                        VerticalSizedBox(20),

                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                FrostedContainers(
                                  theWidth: 200.0,
                                  theHeight: 150.0,
                                  theChild: Addinfo(
                                      icons: Icons.ice_skating,
                                      text: 'u',
                                      maintext: '100',
                                      iconSize: 20,
                                      textSize: 20,
                                      mainTextSize: 20),
                                ),
                                FrostedContainers(
                                  theWidth: 200.0,
                                  theHeight: 150.0,
                                  theChild: Addinfo(
                                      icons: Icons.ice_skating,
                                      text: 'u',
                                      maintext: '100',
                                      iconSize: 20,
                                      textSize: 20,
                                      mainTextSize: 20),
                                ),
                                FrostedContainers(
                                  theWidth: 200.0,
                                  theHeight: 150.0,
                                  theChild: Addinfo(
                                      icons: Icons.ice_skating,
                                      text: 'u',
                                      maintext: '100',
                                      iconSize: 20,
                                      textSize: 20,
                                      mainTextSize: 20),
                                ),
                              ],
                            ),

                         Column(
                           children: [
                             FrostedContainers(
                               theWidth: 200.0,
                               theHeight: 150.0,
                               theChild: Addinfo(
                                   icons: Icons.ice_skating,
                                   text: 'u',
                                   maintext: '100',
                                   iconSize: 20,
                                   textSize: 20,
                                   mainTextSize: 20),
                             ),
                             FrostedContainers(
                               theWidth: 200.0,
                               theHeight: 150.0,
                               theChild: Addinfo(
                                   icons: Icons.ice_skating,
                                   text: 'u',
                                   maintext: '100',
                                   iconSize: 20,
                                   textSize: 20,
                                   mainTextSize: 20),
                             ),
                             FrostedContainers(
                               theWidth: 200.0,
                               theHeight: 150.0,
                               theChild: Addinfo(
                                   icons: Icons.ice_skating,
                                   text: 'u',
                                   maintext: '100',
                                   iconSize: 20,
                                   textSize: 20,
                                   mainTextSize: 20),
                             ),
                           ],
                         ) ],
                        )
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
