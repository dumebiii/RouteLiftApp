// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/model/category.dart';
import 'package:routelift/model/product.dart';
import 'package:routelift/services/service_locator.dart';
import 'package:routelift/viewmodel/descriptionviewmodel.dart';
import 'package:routelift/widgets/custom_bar.dart';
import 'package:routelift/widgets/icontext.dart';
import 'package:routelift/widgets/xm.dart';
import 'package:routelift/widgets/ym.dart';

class Description extends StatefulWidget {
  final Category? dataa;
  const Description({super.key, this.dataa});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final DescriptionViewModel desc = locator<DescriptionViewModel>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final double updateprice = product.productPrice! * desc.qty;
    final String totalprice = updateprice
        .toStringAsFixed(2)
        .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: buildAppBar(context,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              color: klipur,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  IconlyBold.heart,
                  color: klipur,
                  size: 30,
                ),
              ),
            ]),
        body: Stack(alignment: Alignment.topCenter, children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            padding: EdgeInsets.only(top: size.height * 0.13),
            height: size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: klipur),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9),
              child: Column(
                children: [
                  Center(
                    child: Text(product.productName!,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kdeepur,
                        )),
                  ),
                  const Ym(size: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                        icon: 'assets/img/alarm.png',
                        text: '${product.timeToPrepare}mins',
                      ),
                      IconText(
                        icon: 'assets/img/star.png',
                        text: product.rating.toString(),
                      ),
                      IconText(
                        icon: 'assets/img/fire.png',
                        text: '${product.calories}cal',
                      ),
                    ],
                  ),
                  const Ym(size: 15),
                  SingleChildScrollView(
                    child: Text(product.description!,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: kdeepur,
                          height: 2.0,
                        )),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          desc.increment();
                                        });
                                      },
                                      icon: const Text('+',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Poppins',
                                            color: kMapur,
                                          ))),
                                  Text(desc.qty.toString(),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: kBlack,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          desc.decrement();
                                        });
                                      },
                                      icon: const Text('-',
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Poppins',
                                            color: kMapur,
                                          ))),
                                ]),
                          ),
                          const Xm(size: 15),
                          GestureDetector(
                            onTap: () async {
                              await desc.checkoutproducts(
                                  product.productName.toString(),
                                  totalprice,
                                  desc.qty.toString());

                              Navigator.popAndPushNamed(context, '/map',
                                  arguments: desc.checkoutResult);
                            },
                            child: Container(
                                height: 80,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(15)),
                                child: desc.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                        color: kWhite,
                                      ))
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('checkout',
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Poppins',
                                                color: kMidpuur,
                                              )),
                                          RichText(
                                            text: TextSpan(
                                              text: "₦",
                                              style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: klipur,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: totalprice,
                                                  style: const TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w900,
                                                    color: klipur,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Hero(
            tag: 1,
            child: Image.network(
              product.image!,
              height: 250,
              width: double.infinity,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
