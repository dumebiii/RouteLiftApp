import 'package:flutter/material.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/widgets/ym.dart';

class Categoryy extends StatelessWidget {
  const Categoryy({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 14),
      child: Column(
        children: [
          Material(
            elevation: 5,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
                width: 100,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kWhite,
                ),
                child: Image.asset(
                  image,
                  height: 56,
                  width: 56,
                )),
          ),
          const Ym(size: 8),
          Text(name,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kdeepur,
              )),
        ],
      ),
    );
  }
}
