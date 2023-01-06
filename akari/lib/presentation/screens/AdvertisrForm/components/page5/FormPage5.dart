import 'package:akari/data/cubits/AddPrice/AddPriceCubit.dart';
import 'package:akari/data/cubits/addAddress/AddAmintiesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/LocationService.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/page6/FormPage6.dart';

import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormPage5 extends StatefulWidget {
  final String id;
  final String category;
  FormPage5({super.key, required this.id, required this.category});

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
  String paymentValue = "Cash";
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
              // physics: NeverScrollableScrollPhysics(),
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
                        SizedBox(
                          height: 12,
                        ),

                        ToggleButtons(
                          fillColor: Theme.of(context).colorScheme.primary,
                          isSelected: paymentOptionsBool,
                          selectedColor: Colors.white,
                          //  paymentOptions
                          //     .map((e) => bool.fromEnvironment(e["myBool"]))
                          //     .toList(),
                          children: paymentOptions
                              .map((e) => Container(
                                  margin: EdgeInsets.all(12), child: Text(e)))
                              .toList() as List<Widget>,
                          onPressed: (newIndex) {
                            setState(() {
                              for (int myIndex = 0;
                                  myIndex < paymentOptionsBool.length;
                                  myIndex++) {
                                if (myIndex == newIndex) {
                                  paymentOptionsBool[myIndex] = true;
                                  paymentValue = paymentOptions[myIndex];
                                  print(paymentValue);
                                } else {
                                  paymentOptionsBool[myIndex] = false;
                                }
                              }
                            });
                          },
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
                              return "Invalide percentage, it must be a percentage between 0-100";
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
                              width: 20,
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
                              width: 20,
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
                            SizedBox(
                              width: 8,
                            ),
                            Text("Negotiable")
                          ],
                        ),

                        SizedBox(
                          height: 190,
                        ),

                        /////////////////////////////////////

                        BlocBuilder<AddPriceCubit, AddPriceState>(
                          builder: (context, state) {
                            return state is AddPriceLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : myButton(() {
                                    if (_formKey.currentState!.validate()) {
                                      print("HElooooooooooooo");
                                      // myApplication.navigateTo(FormPage6(), context);
                                      AddPriceCubit.get(context).userAddPrice(
                                          inUSD: _priceDollarText.text,
                                          inSP: _priceLsText.text,
                                          paymentOption: paymentValue,
                                          downPaymentPercentage: _dPPText.text,
                                          onlyAcceptUSD: receivedInDollar,
                                          isNegotiable: negotiable,
                                          id: widget.id,
                                          token: CacheHelper.getFromShared(
                                              "token"),
                                          category: widget.category,
                                          context: context);
                                    }
                                  }, "continue  ➔");
                          },
                        ),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
