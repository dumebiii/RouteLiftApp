import 'package:flutter/material.dart';

class Xm extends StatelessWidget {
  const Xm({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
