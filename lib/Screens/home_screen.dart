import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hey_weather/Widgets/frosted_containers.dart';
import 'package:hey_weather/Widgets/hourly_forecast.dart';
import 'package:hey_weather/Widgets/temperatures.dart';
import 'package:hey_weather/Widgets/weekly_forecast.dart';
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
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

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

              final minTemp = weatherDataList['main']['temp_min'];
              final celsiusMin = minTemp - 273.15;
              final celsiusMinStr = celsiusMin.toStringAsFixed(0);

              final maxTemp = weatherDataList['main']['temp_max'];
              final celsiusMax = maxTemp - 273.15;
              final celsiusMaxStr = celsiusMax.toStringAsFixed(0);

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

              return Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/broken night clouds.jpg'),
                          fit: BoxFit.cover)),
                ),

                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      expandedHeight: 200,

                      flexibleSpace: FlexibleSpaceBar(
                          title: SizedBox(
                            height: screenHeight * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('$cityName'),
                                const HorizontalSizedBox(50),
                                InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.location_city,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          )),
                    ),

                    SliverList(
                        delegate: SliverChildListDelegate([
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child:

                            // Main DATA
                            Column(
                              children: [
                                SizedBox(
                                    height: screenHeight * 0.3,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text('$celsiusTempStr°',
                                                style: const TextStyle(
                                                    fontSize: 100,
                                                    color: Colors.white)),

                                            Image.asset(
                                              currentDayNightMode=='d'?
                                                'assets/images/Sun.png':
                                                 'assets/images/Moon.png',
                                                width: 40, height: 40),

                                            Text('$currentSkyDescription',
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white)),
                                          ]),
                                    )),


                                //HOURLY FORECAST
                                FrostedContainers(
                                    theWidth: screenWidth * 0.9,
                                    theHeight: screenHeight * 0.2,
                                    theChild: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ListView.builder(
                                          itemCount: 10,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final hourlyForecast=data['list'][index+1];
                                            final skyDescription=data['list'][index+1]['weather'][0]['main'];
                                            final time=hourlyForecast['main']['temp'].toString();
                                            return HourlyForecast(
                                                time: hourlyForecast['dt'].toString(),
                                                icon: Icons.cloud,
                                                temperature: time);
                                          }),
                                    )),

                                const VerticalSizedBox(20),

                                // WEEKLY FORECAST
                                FrostedContainers(
                                  theHeight: screenHeight * 0.6,
                                  theWidth: screenWidth * 0.9,
                                  theChild: ListView.builder(
                                    physics: const ScrollPhysics(),
                                      itemCount: 7,
                                      itemBuilder: (context, index) {
                                        return const WeeklyForecast(day: 'Wednesday',
                                            icon: Icons.cloud,
                                            skyDescription: 'partly cloud',
                                            temp: '33/22');
                                      }),
                                ),
                                const VerticalSizedBox(20),

                                // AIR QUALITY
                                FrostedContainers(
                                  theWidth: screenWidth * 0.9,
                                  theHeight: screenHeight * 0.1,
                                ),
                                const VerticalSizedBox(20),


                                // ADDITIONAL INFORMATION
                                Row(
                                  children: [
                                    const HorizontalSizedBox(20),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          FrostedContainers(
                                            theWidth: screenWidth * 0.5,
                                            theHeight: screenHeight * 0.2,
                                            theChild: Addinfo(
                                                icons: Icons
                                                    .water_drop_outlined,
                                                text: '$currentHumidity %',
                                                maintext: 'Humidity',
                                                iconSize: 25,
                                                textSize: 20,
                                                mainTextSize: 20),
                                          ),

                                          FrostedContainers(
                                            theWidth: screenWidth * 0.5,
                                            theHeight: screenHeight * 0.2,
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10),
                                          child: FrostedContainers(
                                            theWidth: screenWidth * 0.5,
                                            theHeight: screenHeight * 0.2,
                                            theChild: Addinfo(
                                                icons:
                                                Icons.remove_red_eye_outlined,
                                                text: '$visibilityStr km/h',
                                                maintext: 'Visibility',
                                                iconSize: 25,
                                                textSize: 20,
                                                mainTextSize: 20),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10),
                                          child: FrostedContainers(
                                            theWidth: screenWidth * 0.5,
                                            theHeight: screenHeight * 0.2,
                                            theChild: Addinfo(
                                                icons: Icons.compress,
                                                text: '$currentPressure hpa',
                                                maintext: 'Air Pressure',
                                                iconSize: 25,
                                                textSize: 20,
                                                mainTextSize: 20),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),


                                //SUNRISE AND SUNSET
                                FrostedContainers(
                                  theWidth: screenWidth * 0.9,
                                  theHeight: screenHeight * 0.3,
                                  theChild: Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 20,
                                            width: screenWidth * 0.7,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Colors.red,
                                                      Colors.orange,
                                                      Colors.black,
                                                      Colors.purple,
                                                      Colors.blueAccent
                                                    ])),
                                            child: Image.asset(
                                              currentDayNightMode == 'd' ?
                                              'assets/images/Sun.png'
                                                  : 'assets/images/Moon.png',
                                            )
                                        ),

                                        const VerticalSizedBox(20),

                                        const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text('6:00',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Text('Sun Rise',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                Text('6:00',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Text(
                                                  'Sun Set',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),

                                        const VerticalSizedBox(20),

                                        //LOW AND HIGH TEMPERATURES
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50),
                                          child: Temperatures(
                                            data1: 'L: $celsiusMinStr °',
                                            data2: 'H: $celsiusMaxStr °',
                                          ),
                                        ),
                                        SizedBox(
                                            width: screenWidth * 0.9,
                                            child: const Divider(
                                                color: Colors.white30)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]))
                  ],
                ),
              ]);
            }));
  }
}
