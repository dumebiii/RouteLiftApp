import 'package:flutter/material.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/widgets/xm.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          icon,
          height: 32,
        ),
        const Xm(size: 5),
        Text(text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: kMapur,
            ))
      ],
    );
  }
}
