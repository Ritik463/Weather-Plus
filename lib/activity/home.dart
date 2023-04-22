import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_plus/activity/loding.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:weather_icons/weather_icons.dart';
//import 'package:http/http.dart' as https;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var city_name = ["Delhi", "Bhubnaeswar", "Jamshedpur", "Kolkata", "Paris"];
    final random = new Random();
    var city = city_name[random.nextInt(city_name.length)];
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String Temp = info!["temp_val"].toString().substring(0, 2);
    String humidity = info["hum_val"];
    String airspeed = info["airSpeed_val"];
    String des = info["des_val"].toString().toUpperCase();
    String main = info["main_val"];
    String icon = info["icon_val"];
    String City = info["City_val"].toString().toUpperCase();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.amberAccent,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 224, 66, 1),
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Color(0xfff74ebd5), Color(0xfffACB6E5)]
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/loading",
                            arguments: {"searchText": search.text});
                      },
                      child: Container(
                        child: Icon(Icons.search),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      controller: search,
                      decoration: InputDecoration(
                        hintText: "Search $city",
                        border: InputBorder.none,
                      ),
                    ))
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.9)),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "$des",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Color.fromRGBO(255, 224, 66, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "IN: $City",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromRGBO(255, 224, 66, 1)),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  // const SizedBox(width: 50),
                  Expanded(
                    child: Container(
                      height: 270,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(1)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                      padding: const EdgeInsets.fromLTRB(30, 63, 70, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const Icon(
                          //   WeatherIcons.thermometer,
                          //   size: 25,
                          // ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "image/hot.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "$Temp",
                                  style: const TextStyle(
                                      fontSize: 105,
                                      color: Color.fromRGBO(255, 224, 66, 1),
                                      fontWeight: FontWeight.w800),
                                ),
                                const Text("°",
                                    style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w800,
                                        color: Color.fromRGBO(255, 224, 66, 1)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(1)),
                      margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: const EdgeInsets.all(26),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            "image/101.png",
                            height: 45,
                            width: 45,
                          ),
                          // const Icon(
                          //   WeatherIcons.windy,
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${airspeed}",
                            style: const TextStyle(
                                fontSize: 37,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 224, 66, 1)),
                          ),
                          const Text(
                            "Km/Hr",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 224, 66, 1)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(1)),
                      margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: const EdgeInsets.all(26),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Image.asset(
                            "image/100.png",
                            height: 45,
                            width: 45,
                          ),
                          // const Icon(
                          //   WeatherIcons.humidity,
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$humidity",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 224, 66, 1)),
                          ),
                          const Text(
                            "Percent",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 224, 66, 1)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "Made By Ritik",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
