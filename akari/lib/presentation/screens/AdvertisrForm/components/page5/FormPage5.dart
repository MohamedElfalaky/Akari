import 'package:akari/helpers/LocationService.dart';

import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormPage5 extends StatefulWidget {
  FormPage5({super.key});

  @override
  State<FormPage5> createState() => _FormPage5State();
}

class _FormPage5State extends State<FormPage5> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _priceLsText = TextEditingController();
  final TextEditingController _priceDollarText = TextEditingController();
  final TextEditingController _dPPText = TextEditingController();
  bool receivedInDollar = false;
  bool negotiable = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, // hide keyboard on tap anywhere
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            elevation: 2,
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            leadingWidth: 30,
            title: Container(
              // margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Post new Ad.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Tajawal",
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Address & Price details",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Tajawal",
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircularStepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 5,
                    stepSize: 5,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    unselectedColor: Colors.grey[300],
                    padding: 0,
                    width: 50,
                    height: 50,
                    selectedStepSize: 5,
                    roundedCap: (_, __) => true,
                    child: Center(
                      child: Text(
                        "5/6",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                    margin: EdgeInsets.only(left: 24, right: 24, top: 30),
                    // height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4,
                        ),

                        Row(
                          children: [
                            SvgPicture.asset(priceDetails),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Price details",
                              style: TextStyle(
                                fontSize: 16,
                                // fontFamily: "Tajawal",
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        myTextField(
                          hint: "Price in (LS) *",
                          controller: _priceLsText,
                          keyBoardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Price in (LS)";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "(Set price in Sudanese dinar)",
                              style: TextStyle(
                                  color: Color.fromARGB(118, 12, 13, 77)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        myTextField(
                          hint: "Price in (\$) *",
                          controller: _priceDollarText,
                          keyBoardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Price in ((\$)";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "(Set price in Dollar)",
                              style: TextStyle(
                                  color: Color.fromARGB(118, 12, 13, 77)),
                            )
                          ],
                        ),
                        ////////////////////////////////////////////////////////////////////////////////

                        Text(
                          "Price details",
                          style: TextStyle(
                            fontSize: 16,
                            // fontFamily: "Tajawal",
                          ),
                        ),

                        /////////////////////////////////////////////////////////////////////////////////////
                        SizedBox(
                          height: 16,
                        ),
                        myTextField(
                          hint: "Down payment percentage *",
                          controller: _dPPText,
                          keyBoardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Down payment percentage";
                            } else if (value.length > 2) {
                              return "Invalide percentage";
                            }
                            return null;
                          },
                          suffix: Text(
                            "%",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Checkbox(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: receivedInDollar,
                                onChanged: (value) {
                                  setState(() {
                                    receivedInDollar = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Receive offers only in Dollar")
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Checkbox(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: negotiable,
                                onChanged: (value) {
                                  setState(() {
                                    negotiable = value!;
                                  });
                                },
                              ),
                            ),
                            Text("Negotiable")
                          ],
                        ),

                        SizedBox(
                          height: 250,
                        ),

                        /////////////////////////////////////

                        myButton(() {
                          if (_formKey.currentState!.validate()) {
                            print("HElooooooooooooo");
                          }
                        }, "continue  ➔"),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
