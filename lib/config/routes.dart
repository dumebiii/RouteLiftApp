import 'package:flutter/material.dart';
import 'package:routelift/screens/descriptionscreen.dart';
import 'package:routelift/screens/homescreen.dart';
import 'package:routelift/screens/mapscreen.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => const Home(),
  '/description': (context) => const Description(),
  '/map': (context) => const MapScreen(),
};
