import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/Controls/weather_controler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.light(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherController _weatherCont=Get.put(WeatherController());
 // final LocationContoller _locationContoller=Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Obx(()=>Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Cloud.jpg'),
                fit: BoxFit.fill,
              )),
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: 400,
                    color: Colors.black38,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.location_on,
                              size: 32,
                              color:Colors.black,
                            ),
                            Text(
                              'Indore',
                              style: TextStyle(fontSize: 18, color:Colors.black,),
                            ),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${_weatherCont.temperature.value.toInt()} °C',
                                style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.sunny,
                                size: 38,
                                color: Colors.yellow,
                              ),
                            ]),
                        Text(
                          '${_weatherCont.clouds.value.toInt()}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                            Text(
                              'Updated 25 minutes ago',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                Container(
                  height:100,
                  color: Colors.black26,
                  padding: EdgeInsets.all(20),
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomWeatherWidget(icon: Icons.water_drop, title: 'humidity', value: '${_weatherCont.humidity.value.toInt()}',),
                      VerticalDivider(color:Colors.black),
                      CustomWeatherWidget(icon: Icons.visibility, title: 'visibility', value: '${_weatherCont.visibility.value.toInt()}',),
                      VerticalDivider(color:Colors.black),
                      CustomWeatherWidget(icon: Icons.speed, title: 'pressure', value: '${_weatherCont.pressure.value.toInt()} ph',),
                      VerticalDivider(color:Colors.black),
                    ],
                  ),
                ),
                Container(
                  height:100,
                  color: Colors.black26,
                  padding: EdgeInsets.all(20),
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomWeatherWidget(icon: Icons.wind_power, title: 'Wind', value: '3 m/s',),
                      VerticalDivider(color:Colors.black),
                      CustomWeatherWidget(icon: Icons.device_thermostat, title: 'MinTemp', value: '${_weatherCont.minTemp.value.toInt()}°C',),
                      VerticalDivider(color:Colors.black),
                      CustomWeatherWidget(icon: Icons.device_thermostat, title: 'MaxTemp', value: '${_weatherCont.maxTemp.value.toInt()} °C',),
                      VerticalDivider(color:Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}

class CustomWeatherWidget extends StatelessWidget {
  CustomWeatherWidget({
    required this.icon,
    required this.title,
    required this.value,
    super.key,
  });

  IconData icon;
  String title;
  String value;


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(
          icon,
          size: 20,
          color: Colors.black,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(title, style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black,),
            ),
            Text(
              value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black,),
            )
          ],
        ),
      ],
    );
  }
}
