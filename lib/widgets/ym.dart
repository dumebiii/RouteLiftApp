import 'package:flutter/material.dart';

class Ym extends StatelessWidget {
  const Ym({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
