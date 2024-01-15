import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hey_weather/Widgets/frosted_containers.dart';
import '../Utils/weather_utils.dart';
import '../Widgets/additional_info.dart';
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

              return Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/broken night clouds.jpg'),
                          fit: BoxFit.cover)),
                ),

                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                        title:SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                           Text('$cityName') ,
                            Text('$celsiusTempStr °',style: TextStyle(color: Colors.white),)],
                          ),
                        )
                      ),
                   backgroundColor: Colors.transparent, ),
                   
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 120),
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
                    ]))
                  ],
                  //  Column(
                  //   children: [
                  //     const VerticalSizedBox(20),
                  //     const FrostedContainers(
                  //       theWidth: 400.0,
                  //       theHeight: 100.0,
                  //     ),
                  //     const VerticalSizedBox(20),
                  //     const FrostedContainers(
                  //       theHeight: 400.0,
                  //       theWidth: 400.0,
                  //     ),
                  //     const VerticalSizedBox(20),
                  //     const FrostedContainers(
                  //       theWidth: 390.0,
                  //       theHeight: 50.0,
                  //     ),
                  //     const VerticalSizedBox(20),
                  //     Row(
                  //       children: [
                  //         const HorizontalSizedBox(30),
                  //         Expanded(
                  //           flex: 3,
                  //           child: Column(
                  //             children: [
                  //               FrostedContainers(
                  //                 theWidth: 200.0,
                  //                 theHeight: 150.0,
                  //                 theChild: Addinfo(
                  //                     icons: Icons.water_drop_outlined,
                  //                     text: '$currentHumidity %',
                  //                     maintext: 'Humidity',
                  //                     iconSize: 25,
                  //                     textSize: 20,
                  //                     mainTextSize: 20),
                  //               ),
                  //               FrostedContainers(
                  //                 theWidth: 200.0,
                  //                 theHeight: 150.0,
                  //                 theChild: Addinfo(
                  //                     icons: FontAwesomeIcons.wind,
                  //                     text: '$windSpeed mi',
                  //                     maintext: 'Wind Speed',
                  //                     iconSize: 25,
                  //                     textSize: 20,
                  //                     mainTextSize: 20),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         const HorizontalSizedBox(10),
                  //         Column(
                  //           children: [
                  //             FrostedContainers(
                  //               theWidth: 200.0,
                  //               theHeight: 150.0,
                  //               theChild: Addinfo(
                  //                   icons: Icons.remove_red_eye_outlined,
                  //                   text: '$visibilityStr km/h',
                  //                   maintext: 'Visibility',
                  //                   iconSize: 25,
                  //                   textSize: 20,
                  //                   mainTextSize: 20),
                  //             ),
                  //             FrostedContainers(
                  //               theWidth: 200.0,
                  //               theHeight: 150.0,
                  //               theChild: Addinfo(
                  //                   icons: Icons.compress,
                  //                   text: '$currentPressure hpa',
                  //                   maintext: 'Air Pressure',
                  //                   iconSize: 25,
                  //                   textSize: 20,
                  //                   mainTextSize: 20),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 120),
                  //       child: FrostedContainers(
                  //         theWidth: 300.0,
                  //         theHeight: 180.0,
                  //         theChild: Addinfo(
                  //             icons: FontAwesomeIcons.temperatureHalf,
                  //             text: '$feelsLikeTempStr °',
                  //             maintext: 'Feels Like',
                  //             iconSize: 25,
                  //             textSize: 20,
                  //             mainTextSize: 20),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ]);
            }));
  }
}
