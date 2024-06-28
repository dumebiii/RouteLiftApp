import 'package:flutter/material.dart';
import 'package:routelift/screens/descriptionscreen.dart';
import 'package:routelift/screens/homescreen.dart';
import 'package:routelift/screens/hostel.dart';
import 'package:routelift/screens/mapscreen.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => const Home(),
  '/description': (context) => const Description(),
  '/hostel': (context) => const Hostell(),
  '/map': (context) => const MapScreen(),
};
