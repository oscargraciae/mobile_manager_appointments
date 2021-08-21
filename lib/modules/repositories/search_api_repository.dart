import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:reserly_manager/models/Place.dart';

abstract class SearchRepository {
  Stream<List<Place>?> get onResults;
  void cancel();
  void dispose();
  void search(String query, LatLng at);
}