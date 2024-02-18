import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  @override
  void onInit() {
    fetchPosition();
    super.onInit();
  }

  Position? position;
  var lat = "".obs;

  var adress = "".obs;


  fetchPosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        Get.snackbar("error", "permisiion is disabled");
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("permison denied", "permissiondenid");
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("permissiondenied forever", "forever");
      }
      Position curentposition = await Geolocator.getCurrentPosition();

      // position = curentposition;
      // lat.value = curentposition.latitude.toString();
      // print(position);
      // print(lat);
      convertCord(curentposition.latitude, curentposition.longitude);
    } catch (e) {
      Get.snackbar("Eror", "$e");
    }
  }

  convertCord(var lat, var long) async {
    try {
      
      List<Placemark> placemark = await placemarkFromCoordinates(lat, long);

      adress.value =
          "${placemark.last.subAdministrativeArea},${placemark.last.administrativeArea}";
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }
}
