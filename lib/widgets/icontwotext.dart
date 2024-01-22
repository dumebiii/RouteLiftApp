import 'package:flutter/material.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/widgets/xm.dart';

class IconcolText extends StatelessWidget {
  const IconcolText({
    super.key,
    required this.sectext,
    required this.firsttext,
    required this.icon,
    required this.font1,
    required this.font2,
  });
  final Widget icon;
  final String firsttext;
  final String sectext;
  final double font1;
  final double font2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const Xm(size: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                firsttext,
                softWrap: true,
                style: TextStyle(
                  fontSize: font1,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: kdeepur,
                ),
              ),
              Text(
                sectext,
                style: TextStyle(
                  fontSize: font2,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  color: kMapur,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
