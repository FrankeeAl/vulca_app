import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vulca_app/model/place.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PlacesService {
  final key = 'AIzaSyBxgh48drTIyXPh11F49e_S-f4ErKuNZLA';

  Future<List<Place>> getPlaces(
      double lat, double lng, BitmapDescriptor icon) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=business&name=vulcanizing&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place, icon)).toList();
  }
}
