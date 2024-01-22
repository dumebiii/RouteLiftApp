import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routelift/services/api_service.dart';
import 'package:routelift/services/service_locator.dart';
import 'package:routelift/viewmodel/descriptionviewmodel.dart';

class MapViewModel extends ChangeNotifier {
  final Apiservice apiservice = locator<Apiservice>();
  final DescriptionViewModel desc = locator<DescriptionViewModel>();

  LatLng driverLocation = const LatLng(6.605874, 3.349149);
  LatLng deliveryLocation = const LatLng(6.6999, 4.11667);
  Set<Polyline> polylines = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  Completer<GoogleMapController> controller = Completer();
  BitmapDescriptor senderIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor recieverIcon = BitmapDescriptor.defaultMarker;

  void addSenderIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(24, 24)),
      "assets/img/delivery.png",
    ).then(
      (icon) {
        senderIcon = icon;
        notifyListeners();
      },
    );
  }

  void addRecIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(24, 24)),
      "assets/img/indi.png",
    ).then(
      (icon) {
        recieverIcon = icon;
        notifyListeners();
      },
    );
  }
}
