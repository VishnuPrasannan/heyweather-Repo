import 'package:flutter/material.dart';
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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Lp_bg.jpg'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: InkWell(onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                            const Homepage()));
                  },
                    child: FrostedContainers(
                      theHeight: 500.0,
                      theWidth: 400.0,
                      theChild: Center(
                        child: Column(
                          children: [

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
                            Text(cityName,style: TextStyle(color: Colors.white),),

                            Text(
                              '$celsiusTempStr°',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 90),
                            ),

                            Text(
                              currentSkyDescription,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),

                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                   Image.asset('assets/images/low temperature.png',height: 50,width: 70,),
                                    Text('Low:')
                                  ],
                                ),
                             Text('HigH:') ],
                            ),


                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
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
                ),
              )
            ]);
          }),
    );
  }
}
