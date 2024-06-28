import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routelift/services/api_service.dart';
import 'package:routelift/services/service_locator.dart';
import 'package:routelift/viewmodel/descriptionviewmodel.dart';
import 'package:routelift/viewmodel/hostelviewmodel.dart';

class MapViewModel extends ChangeNotifier {
  final Apiservice apiservice = locator<Apiservice>();
  final DescriptionViewModel desc = locator<DescriptionViewModel>();
  final HostelViewModel hoste = locator<HostelViewModel>();

  LatLng driverLocation = const LatLng(7.851347969848399, 3.9478312212036255);
  LatLng? deliveryLocation;
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
