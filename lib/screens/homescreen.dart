import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/model/product.dart';
import 'package:routelift/services/service_locator.dart';
import 'package:routelift/viewmodel/homeviewmodel.dart';
import 'package:routelift/widgets/category.dart';
import 'package:routelift/widgets/popfood.dart';
import 'package:routelift/widgets/ym.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Product>>? homeproducts;
  final HomeViewModel home = locator<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    homeproducts = home.products();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klipur,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: klipur, spreadRadius: 0, blurRadius: 15),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kMapur,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.home,
                  color: kGold,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.search,
                  color: kGold,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.heart,
                  color: kGold,
                ),
                label: 'Heart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyBroken.buy,
                  color: kGold,
                ),
                label: 'Checkout',
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: homeproducts,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Product> data = snapshot.data;

              return SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: 60, left: 15, bottom: 15, right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/img/burg.png',
                            height: 24,
                            width: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Image.asset(
                              'assets/img/girl.png',
                              height: 50,
                              width: 50,
                            ),
                          )
                        ]),
                    const Ym(size: 50),
                    const Center(
                      child: Text(
                        'AJAYI CROWTHER UNIVERSITY',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w900,
                          color: kMapur,
                        ),
                      ),
                    ),
                    const Ym(size: 2),

                    const Center(
                      child: Text(
                        'Delivery App',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w900,
                          color: kGold,
                        ),
                      ),
                    ),
                    const Ym(size: 40),
                    // const Category(),
                    SizedBox(
                      height: 155,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: home.categories.length,
                        itemBuilder: (context, index) {
                          return Categoryy(
                            image: home.categories[index].image,
                            name: home.categories[index].name,
                          );
                        },
                      ),
                    ),
                    const Text(
                      'Popular now.',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: kMapur,
                      ),
                    ),
                    const Ym(size: 10),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Popfood(
                              name: data[index].productName!,
                              img: data[index].image!,
                              price: data[index].productPrice!,
                              onTap: () {
                                Navigator.pushNamed(context, '/description',
                                    arguments: data[index]);
                              });
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Internet connection, Try again',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kdeepur,
                    )),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: kdeepur,
              ));
            }
          }),
    );
  }
}
