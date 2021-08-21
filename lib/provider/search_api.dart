import 'dart:async';

import 'package:dio/dio.dart';
import 'package:reserly_manager/models/Place.dart';
import 'package:reserly_manager/models/geocode.dart';

import 'package:reserly_manager/types/json_type.dart';

class SearchAPI {
  final Dio _dio;

  SearchAPI(this._dio);

  CancelToken? _cancelToken;

  Future<List<Prediction>> search(String query) async {
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?',
        queryParameters: {
          "key": 'AIzaSyD4dAUayOWy12OKwc4WUnJNPfZsJnPgyIw',
          "input": query,
          "[types]": "(regions),address"
          // "at": "${at.latitude},${at.longitude}",
          // "in": "countryCode:ECU",
          // "types": "place,street,city,locality,intersection",
        },
      );

      PredictionResponse res = PredictionResponse.fromJson(response.data);
      return res.predictions;
    } on DioError catch (e) {
      print('ERROR DE GOOGLE MAPS');
      print(e);
      throw e;
    }
  }

  Future<Geocode> getGeocoderById(String placeId) async {
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/geocode/json?',
        queryParameters: {
          "key": 'AIzaSyD4dAUayOWy12OKwc4WUnJNPfZsJnPgyIw',
          "place_id": placeId,
          // "at": "${at.latitude},${at.longitude}",
          // "in": "countryCode:ECU",
          // "types": "place,street,city,locality,intersection",
        },
      );

      Geocode res = Geocode.fromJson(response.data);
      return res;
    } catch (error) {
      throw error;
    }
  }

}
