import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String id, title, address;
  final LatLng position;
  final int distance;

  Place({
    required this.id,
    required this.title,
    required this.address,
    required this.position,
    required this.distance,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      title: json['title'],
      address: json['address']['label'],
      position: LatLng(
        json['position']['lat'],
        json['position']['lng'],
      ),
      distance: json['distance'],
    );
  }
}

// To parse this JSON data, do
//
//     final prediction = predictionFromJson(jsonString);


Prediction predictionFromJson(String str) => Prediction.fromJson(json.decode(str));

String predictionToJson(Prediction data) => json.encode(data.toJson());

class Prediction {
  Prediction({
    required this.description,
    required this.placeId,
    required this.reference,
    required this.types,
  });

  String description;
  String placeId;
  String reference;
  List<String> types;

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    description: json["description"],
    placeId: json["place_id"],
    reference: json["reference"],
    types: List<String>.from(json["types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "place_id": placeId,
    "reference": reference,
    "types": List<dynamic>.from(types.map((x) => x)),
  };
}


class PredictionResponse {
  PredictionResponse({
    required this.predictions,
  });

  List<Prediction> predictions;

  factory PredictionResponse.fromJson(Map<String, dynamic> json) => PredictionResponse(
    predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
  };
}