import 'package:geolocator/geolocator.dart';

class Location {
  double lati;
  double longi;
  Future<void> getCurrentPosition() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied)
      permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lati = position.latitude;
      longi = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
