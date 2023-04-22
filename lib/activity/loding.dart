// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_plus/get_data/worker.dart';

class Loading extends StatefulWidget {
  final bool isLoading;
  const Loading({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "jamshedpur";
  late String temp;
  late String humidity;
  late String airspeed;
  late String main;
  late String des;
  late String icon;

  void startApp() async {
    Worker instance = Worker(location: city);
    await instance.getData();
    temp = instance.temp;
    humidity = instance.humidity;
    airspeed = instance.airspeed;
    main = instance.main;
    des = instance.des;
    icon = instance.icon;

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_val": temp,
        "hum_val": humidity,
        "airSpeed_val": airspeed,
        "main_val": main,
        "des_val": des,
        "icon_val": icon,
        "City_val": city
      });
    });

    // print("run");
    // print(instance.humidity);
  }

  @override
  void initState() {
    print("object");
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      Map? search = ModalRoute.of(context)?.settings.arguments as Map;

      if (search.isNotEmpty && search != null) {
        setState(() {
          city = search['searchText'];
          startApp();
        });
      }
    }

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 224, 66, 1),
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Lottie.asset("Animation/b.json", height: 150, width: 150),
                  // Image(
                  //     height: 430, width: 430, image: AssetImage('image/w.png')),
                  // Padding(EdgeInsets: EdgeInsets.fromLTRB(0, 0, 0, 0));
                  // Image(
                  //     height: 100,
                  //     width: 100,
                  //     image: AssetImage(
                  //       'image/5.gif',
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ),
      //  backgroundColor: Colors.black,
    );
  }
}
