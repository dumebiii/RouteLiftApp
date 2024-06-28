import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:routelift/config/constants.dart';
import 'package:routelift/services/service_locator.dart';
import 'package:routelift/viewmodel/hostelviewmodel.dart';
import 'package:custom_radio_group_list/custom_radio_group_list.dart';

class Hostell extends StatefulWidget {
  const Hostell({super.key});

  @override
  State<Hostell> createState() => _HostellState();
}

class _HostellState extends State<Hostell> {
  final HostelViewModel hote = locator<HostelViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klipur,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 60, left: 15, bottom: 40, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 30,
                          color: kMapur,
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Choose your hostel',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: kMapur,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RadioGroup(
                    fillColor: kdeepur,
                    items: hote.hostels,
                    selectedItem: hote.hostelchosen,
                    onChanged: (value) {
                      hote.hostelchosen = value;
                      setState(() {});
                    },
                    labelBuilder: (ctx, index) {
                      return Row(
                        children: [
                          Text(
                            '${hote.hostels[index].hostelName}',
                            style: const TextStyle(
                                color: kGold,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      );
                    },
                    shrinkWrap: true,
                    disabled: false),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: hote.hostelchosen != null
                      ? () {
                          Navigator.popAndPushNamed(context, '/map',
                              arguments: hote.hostelchosen);
                        }
                      : null,
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        color: hote.hostelchosen == null ? Colors.grey : kMapur,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: kWhite, fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
