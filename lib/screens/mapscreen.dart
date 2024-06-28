// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/model/checkout.dart';
import 'package:routelift/model/hostel.dart';
import 'package:routelift/services/service_locator.dart';
import 'package:routelift/viewmodel/mapviewmodel.dart';
import 'package:routelift/widgets/icontwotext.dart';
import 'package:routelift/widgets/xm.dart';
import 'package:routelift/widgets/ym.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapViewModel map = locator<MapViewModel>();

  @override
  void initState() {
    super.initState();
    map.polylinePoints = PolylinePoints();
    map.addSenderIcon();
    map.addRecIcon();
  }

  @override
  Widget build(BuildContext context) {
    Hostel checkoutt = ModalRoute.of(context)!.settings.arguments as Hostel;
    map.deliveryLocation = checkoutt.hostelcoordinates;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: map.driverLocation,
                zoom: 17.0,
              ),
              zoomControlsEnabled: false,
              polylines: map.polylines,
              markers: {
                Marker(
                    markerId: const MarkerId("driver's location"),
                    icon: map.senderIcon,
                    position: map.driverLocation),
                Marker(
                    markerId: const MarkerId("delivery location"),
                    icon: map.recieverIcon,
                    position: map.deliveryLocation!)
              },
              onMapCreated: (GoogleMapController controller) {
                map.controller.complete(controller);

                setPolylines();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: klipur),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30,
                        color: kMapur,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: klipur),
                      child: const Icon(
                        Icons.my_location,
                        size: 30,
                        color: kMapur,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 35, left: 35, bottom: 50),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kWhite),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              IconcolText(
                                font1: 21,
                                font2: 14,
                                icon: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: klipur),
                                    child: const Icon(
                                      Icons.access_time_rounded,
                                      size: 30,
                                      color: kdeepur,
                                    )),
                                firsttext: "5 mins",
                                sectext: 'Delivery Time',
                              ),
                              const Ym(size: 20),
                              IconcolText(
                                font1: 17,
                                font2: 14,
                                icon: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: klipur),
                                    child: const Icon(
                                      Icons.location_pin,
                                      size: 30,
                                      color: kdeepur,
                                    )),
                                firsttext: checkoutt.hostelName!,
                                sectext: 'Delivery Adress',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 185,
                    right: 35,
                    left: 35,
                    child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kdeepur),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/img/face.png',
                                    height: 70,
                                    width: 70,
                                  ),
                                  const Xm(size: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'James Tunde',
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 21,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            color: klipur,
                                          ),
                                        ),
                                        Text(
                                          "08169087630",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                            color: klipur,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: klipur),
                                    child: const Icon(
                                      Icons.call,
                                      size: 30,
                                      color: kMapur,
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void setPolylines() async {
    print(map.deliveryLocation);
    PolylineResult result = await map.polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDdfXG9xg1eN3a8RWkP8o6kBSPt-78uKsU",
        PointLatLng(map.driverLocation.latitude, map.driverLocation.longitude),
        PointLatLng(
            map.deliveryLocation!.latitude, map.deliveryLocation!.longitude),
        travelMode: TravelMode.driving,
        optimizeWaypoints: true);

    if (result.status == 'OK') {
      for (var point in result.points) {
        map.polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        map.polylines.add(Polyline(
            width: 5,
            polylineId: const PolylineId('polyLine'),
            color: kMapur,
            points: map.polylineCoordinates));
      });
    }
  }
}
