import 'dart:convert';
import 'package:http/http.dart' as https;

class Worker {
  String location;
  Worker({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String airspeed;
  late String main;
  late String des;
  late String icon;
  Future<void> getData() async {
    try {
      var response = await https.post(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c4af8f9363672f8a9632655ac6d12c11&units=metric'),
      );
      var decoded = jsonDecode(response.body);

      //  geting temprature and humidity
      Map data = decoded;
      Map tempData = data['main'];
      double gettemp = tempData['temp'];
      String gethumidity = tempData['humidity'].toString();
      Map wind = data['wind'];
      double getairSpeed = wind['speed'];
      List weatherData = data['weather'];
      Map weatherMdata = weatherData[0];
      String getmainDes = weatherMdata['description'];
      String getdesc = weatherMdata["description"];

      // print(getdesc);
      // Map data = decoded;
      // Map temp_data = data['main'];
      // double temp = temp_data['temp'];
      // print(temp);
      // print(decoded);
      // }

// giving values to our variable
      temp = gettemp.toString();
      humidity = gethumidity;
      airspeed = getairSpeed.toString();
      des = getdesc;
      main = getmainDes;
      icon = weatherMdata["icon"].toString();
    } catch (e) {
      temp = "-".toString();
      humidity = "-";
      airspeed = "City-";
      des = "-";
      main = "-";
      icon = "50n";
    }
  }
}
