import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:smarttextile/Business/Invoice/driver.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation(Driver driver) async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
      print("$latitude" + "$longitude");
      updatelocation("${driver.driverID}","$longitude","$latitude");
      getLocationData();
    } catch (e) {
      print(e);
    }
  }

  final baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";

  Future<void> updatelocation(String id,String lon,String lat) async{

    try{
      http.Response response = await http.put(
        "${baseUrl}drivers/updateLocation/$id/$lon/$lat",
      );
      print(response.statusCode);
    }catch(e){
      print(e);
    }

  }

  void getLocationData() async {
    try {
      http.Response response = await http.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=b38f1e492e9970af61d8cce16fe83d21&units=metric");
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
