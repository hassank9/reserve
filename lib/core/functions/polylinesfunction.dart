import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyLine(srcLat, scrLong, destLat, destLang) async {
  Set<Polyline> polylineSet = {};
  List<LatLng> polylineCord = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$srcLat,$scrLong&destination=$destLat,$destLang&key=AIzaSyDDGkCCzjAh_yRBbAdWgli65gViBTzcDJg";

  var response = await http.post(Uri.parse(url));

  var responseBody = jsonDecode(response.body);

  var points = responseBody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(points);

  if (result.isNotEmpty) {
    for (PointLatLng pointLatLng in result) {
      polylineCord.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    }
  }

  Polyline polyline = Polyline(
      polylineId: PolylineId("flutter"),
      points: polylineCord,
      color: Color(0xff598810),
      width: 6);

  polylineSet.add(polyline);

  return polylineSet;
}
