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

            return
                // Stack(
                // children: [
                //   Container(
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage(
                //
                //               //   //Broken Clouds
                //               //   currentDayNightMode == 'n' &&
                //               //           currentSkyDescription == 'broken clouds'
                //               //       ? 'assets/images/pure black background.jpg'
                //               //       : currentDayNightMode == 'd' &&
                //               //               currentSkyDescription ==
                //               //                   'broken clouds'
                //               //           ? 'assets/images/scattered day clouds.jpg'
                //               //           :
                //               //
                //               //           //Scattered Clouds
                //               //           currentDayNightMode == 'd' &&
                //               //                   currentSkyDescription ==
                //               //                       'scattered clouds'
                //               //               ? 'assets/images/scattered daysky.jpg'
                //               //               : currentDayNightMode == 'n' &&
                //               //                       currentSkyDescription ==
                //               //                           'scattered clouds'
                //               //                   ? 'assets/images/scattered nightsky.jpg'
                //               //                   :
                //               //
                //               //                   //Overcast clouds
                //               //
                //               //           currentDayNightMode == 'd' && currentSkyDescription ==
                //               //                               'overcast clouds'
                //               //               ? 'assets/images/overcast day 2.jpg'
                //               //               : currentDayNightMode == 'n' && currentSkyDescription ==
                //               //               'overcast clouds'
                //               //               ? 'assets/images/night overcast clouds.jpg'
                //               //               : 'assets/images/satellital view.jpg'
                //               //
                //               //   // Fewer Clouds
                //               //
                //               // //clear sky
                //               //
                //               // // Snow
                //               //
                //               //   //Rain
                //               //
                //               // // light rain
                //
                //                 ),
                //             fit: BoxFit.cover)),
                //   ),

                ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white,
                          Colors.black54,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const VerticalSizedBox(10),
                        Text(
                          '$celsiusTempStr°C',
                          style: const TextStyle(
                              fontSize: 50, color: primarycolor),
                        ),
                        Icon(
                          currentSky == 'Clouds' || currentSky == 'Rain'
                              ? Icons.cloud
                              : Icons.sunny,
                          color: primarycolor,
                          size: 40,
                        ),
                        Text(
                          currentSkyDescription,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),

                const VerticalSizedBox(20),

                //Scrolling Containers
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Weather Forecast',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Hourly Weather Forecast
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FrostedContainers(
                    theChild: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HorizontalSizedBox(23),
                          SideScrollers(
                            text: '9:00',
                            subtext: '301.07',
                            icon: Icons.cloud,
                          ),
                          HorizontalSizedBox(10),
                          SideScrollers(
                            text: '12:45',
                            subtext: '200.01',
                            icon: Icons.sunny,
                          ),
                          HorizontalSizedBox(10),
                          SideScrollers(
                            text: '8:00',
                            subtext: '101.09',
                            icon: Icons.cloud,
                          ),
                          HorizontalSizedBox(10),
                          SideScrollers(
                            text: '5:15',
                            subtext: '501.7',
                            icon: Icons.sunny,
                          ),
                          HorizontalSizedBox(10),
                          SideScrollers(
                            text: '4:00',
                            subtext: '400.06',
                            icon: Icons.cloud,
                          ),
                          HorizontalSizedBox(10),
                          SideScrollers(
                            text: '6:45',
                            subtext: '300.02',
                            icon: Icons.sunny,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Third Row
                const VerticalSizedBox(20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26),
                  child: Text(
                    'Additional Information',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),

                const VerticalSizedBox(10),

                //Additional Information
                Row(
                  children: [
                    const HorizontalSizedBox(20),
                    Column(
                      children: [
                        Addinfo(
                          icons: FontAwesomeIcons.droplet,
                          iconSize: 20,
                          text: '$currentHumidity %',
                          textSize: 20,
                          maintext: 'Humidity',
                          mainTextSize: 20,
                        ),
                        const VerticalSizedBox(20),
                        Addinfo(
                          icons: FontAwesomeIcons.wind,
                          iconSize: 20,
                          text: '$windSpeed mi',
                          textSize: 20,
                          maintext: 'Wind',
                          mainTextSize: 20,
                        ),
                        const VerticalSizedBox(20),
                      ],
                    ),
                    const HorizontalSizedBox(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Addinfo(
                          icons: FontAwesomeIcons.eye,
                          iconSize: 20,
                          text: '$visibilityStr kms',
                          textSize: 20,
                          maintext: 'Visibility',
                          mainTextSize: 20,
                        ),
                        const VerticalSizedBox(20),
                        Addinfo(
                          icons: Icons.compress_rounded,
                          iconSize: 25,
                          text: '$currentPressure hpa',
                          textSize: 20,
                          maintext: 'Air Pressure',
                          mainTextSize: 20,
                        ),
                        const VerticalSizedBox(20),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    height: 123,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blueAccent,
                          Colors.grey,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        const VerticalSizedBox(10),
                        const Icon(
                          (FontAwesomeIcons.temperatureHalf),
                          size: 30,
                        ),
                        const Text(
                          'Feels like',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('$feelsLikeTempStr°C',
                            style: const TextStyle(fontSize: 25))
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
