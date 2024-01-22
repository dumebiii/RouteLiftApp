import 'package:flutter/material.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/widgets/ym.dart';
import 'package:shimmer/shimmer.dart';

class Popfood extends StatelessWidget {
  const Popfood({
    super.key,
    required this.img,
    required this.price,
    required this.name,
    required this.onTap,
  });

  final String img;
  final double price;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 215,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 70,
              left: 0,
              child: Material(
                elevation: 5,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                    width: 200,
                    height: 178,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kWhite,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 70, bottom: 0, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name,
                              softWrap: true,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: kdeepur,
                              )),
                          const Ym(size: 8),
                          RichText(
                            text: TextSpan(
                              text: "₦",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: kMapur,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: price.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: kMapur,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Positioned(
              top: 0,
              left: 3,
              right: 27,
              child: Image.network(
                img,
                height: 140,
                width: 140,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            height: 100,
                            width: 50,
                          )));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
