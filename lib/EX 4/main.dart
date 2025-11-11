import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum WeatherStatus {
  cloudy('cloudy'),
  sunny('sunny'),
  sunnyCloudy('sunnyCloudy'),
  veryCloudy('veryCloudy');

  final String assetName;

  const WeatherStatus(this.assetName);
}

enum City {
  phnomPenh(
    displayName: 'Phnom Penh',
    weather: WeatherStatus.cloudy,
    currentTemp: '12.2',
    minTemp: '10.0',
    maxTemp: '30.0',
    gradientColors: [Color(0xFFE8A0C9), Color(0xFFC8A0E8)], // Pink to Purple
  ),
  paris(
    displayName: 'Paris',
    weather: WeatherStatus.sunnyCloudy,
    currentTemp: '8.5',
    minTemp: '5.0',
    maxTemp: '15.0',
    gradientColors: [Color(0xFFA5D6FF), Color(0xFF80E8FF)], // Blue to Cyan
  ),
  tokyo(
    displayName: 'Tokyo',
    weather: WeatherStatus.sunny,
    currentTemp: '15.3',
    minTemp: '12.0',
    maxTemp: '22.0',
    gradientColors: [Color(0xFFFFB380), Color(0xFFFF8080)], // Orange to Red
  ),
  rome(
    displayName: 'Rome',
    weather: WeatherStatus.veryCloudy,
    currentTemp: '18.7',
    minTemp: '14.0',
    maxTemp: '25.0',
    gradientColors: [Color(0xFFFFD699), Color(0xFFFFB366)], // Amber to Orange
  );

  final String displayName;
  final WeatherStatus weather;
  final String currentTemp;
  final String minTemp;
  final String maxTemp;
  final List<Color> gradientColors;

  const City({
    required this.displayName,
    required this.weather,
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.gradientColors,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ឧតុនិយម"), centerTitle: false),
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Select a specific country weather',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(title: Text("Cambodia")),
              ListTile(title: Text("France")),
              ListTile(title: Text("Japan")),
              ListTile(title: Text("Spain")),
            ],
          ),
        ),
        backgroundColor: Colors.amber,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView.builder(
            itemCount: City.values.length,
            itemBuilder: (context, index) {
              final city = City.values[index];

              return Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Stack(
                    children: [
                      PhysicalModel(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.black,
                        color: Colors.white,
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: city.gradientColors,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: AssetImage(
                                            'assets/ex4/${city.weather.assetName}.png',
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              city.displayName,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Min: ${city.minTemp} °C",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            Text(
                                              "Max: ${city.maxTemp} °C",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${city.currentTemp} °C",
                                      style: TextStyle(
                                        fontSize: 52,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white.withOpacity(
                                    0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
