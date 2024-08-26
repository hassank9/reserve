import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late bool serviceEnabled;
  late LocationPermission permission;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await requestLocationPermession();
    return this;
  }



  requestLocationPermession() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Get.snackbar(
      //     'Location Permession', 'Location services are disabled.');
      print("###############-Location services are disabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Get.snackbar(
        //     'Location Permession', 'Location permissions are denied');
        print("###############-Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // return Get.snackbar('Location Permession',
      //     'Location permissions are permanently denied, we cannot request permissions.');
      print(
          "###############-Location permissions are permanently denied, we cannot request permissions.");
    }
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
