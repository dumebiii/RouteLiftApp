import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routelift/model/hostel.dart';

class HostelViewModel extends ChangeNotifier {
  List<Hostel> hostels = [
    Hostel(
        hostelName: "Joseph Adetiloye Hall(JAH)",
        hostelcoordinates: const LatLng(7.848959277710973, 3.9502496489493417)),
    Hostel(
        hostelName: "Lagos Hostel",
        hostelcoordinates: const LatLng(7.847338402210684, 3.947219561237456)),
    Hostel(
        hostelName: "Ibadan Hostel",
        hostelcoordinates: const LatLng(7.847459619151162, 3.946632219591229)),
    Hostel(
        hostelName: "University Male Hostel",
        hostelcoordinates: const LatLng(7.847423400249457, 3.9475577650525957)),
    Hostel(
        hostelName: "Sheperds inn",
        hostelcoordinates: const LatLng(7.8503849, 3.9486052)),
    Hostel(
        hostelName: "University Female Hostel",
        hostelcoordinates: const LatLng(7.851430754803627, 3.948348440356326)),
    Hostel(
        hostelName: "Dioces of Lagos West Hall(DLW)",
        hostelcoordinates: const LatLng(7.8497811, 3.9453815)),
    Hostel(
        hostelName: "Goshen inn",
        hostelcoordinates: const LatLng(7.851492514487737, 3.946622945283126)),
  ];

  Hostel? hostelchosen;
}
