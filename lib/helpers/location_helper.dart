import 'dart:convert';

import 'package:great_places/api_key.dart';
import 'package:http/http.dart';

const API_KEY = GOOGLE_API_KEY;

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude,}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async{
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$API_KEY';
    final response = await get(url);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}