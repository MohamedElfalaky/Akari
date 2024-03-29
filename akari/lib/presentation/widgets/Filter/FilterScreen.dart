import 'package:akari/data/cubits/SearchFromHome/SearchFromHomeCubit.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/widgets/Shared/myOutLinedButton.dart';
import '../../../helpers/AppLocalizations.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/Filter/FilterAppBar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> contractTapsList = [];
  List<String> filterTapsList = [];
  // final List<String> unitLawsTapsList = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: myApplication.widthClc(context, 8),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 16),
                    vertical: myApplication.hightClc(context, 16),
                  ),
                  color: const Color(0xFFFFFFFF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contract Type".tr(context),
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Tajawal",
                            color: Color(0xFF363A3D)),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: myApplication.hightClc(context, 19)),
                          child: Row(
                            // scrollDirection: Axis.horizontal,
                            children:
                                contractTaps // لما كتبت الليست هارد كود هنا السيتستيت مشتغلتش!
                                    .map((e) => InkWell(
                                          child: FilterTab(
                                              e["name"].toString().tr(context),
                                              e["bool"]),
                                          onTap: () {
                                            if (contractTapsList
                                                    .where((element) =>
                                                        element == e["name"])
                                                    .isNotEmpty &&
                                                contractTapsList
                                                        .where((element) =>
                                                            element ==
                                                            e["name"])
                                                        .first ==
                                                    e["name"]) {
                                              setState(() {
                                                contractTapsList
                                                    .remove(e["name"]);
                                                e["bool"] = false;
                                              });
                                            } else {
                                              setState(() {
                                                contractTapsList.add(e["name"]);
                                                e["bool"] = true;
                                              });
                                            }
                                            print(contractTapsList);
                                          },
                                        ))
                                    .toList(),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: myApplication.hightClc(context, 8),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 16),
                    vertical: myApplication.hightClc(context, 16),
                  ),
                  color: const Color(0xFFFFFFFF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Property Type".tr(context),
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Tajawal",
                            color: Color(0xFF363A3D)),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: myApplication.hightClc(context, 19)),
                          child: Wrap(
                              children: myTaps
                                  .map((e) => InkWell(
                                        child: FilterTab(
                                            e["name"].toString().tr(context),
                                            e["bool"]),
                                        onTap: () {
                                          // filterTapsList.removeWhere(
                                          //     (element) => element == e["name"]);

                                          if (filterTapsList
                                                  .where((element) =>
                                                      element == e["name"])
                                                  .isNotEmpty &&
                                              filterTapsList
                                                      .where((element) =>
                                                          element == e["name"])
                                                      .first ==
                                                  e["name"]) {
                                            setState(() {
                                              filterTapsList.remove(e["name"]);
                                              e["bool"] = false;
                                            });
                                            print(filterTapsList);
                                          } else {
                                            setState(() {
                                              filterTapsList.add(e["name"]);
                                              e["bool"] = true;
                                            });
                                            print(filterTapsList);
                                          }
                                        },
                                      ))
                                  .toList())),
                    ],
                  ),
                ),
                SizedBox(
                  height: myApplication.hightClc(context, 8),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 16),
                    vertical: myApplication.hightClc(context, 16),
                  ),
                  color: const Color(0xFFFFFFFF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price ( SD )".tr(context),
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Tajawal",
                            color: Color(0xFF363A3D)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 16),
                          // height: myApplication.hightClc(context, 40),
                          child: Row(
                            // scrollDirection: Axis.horizontal,
                            children: [
                              Expanded(
                                  child: TextFormField(
                                controller: myController1,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter initial price"
                                        .tr(context);
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(myController1.text)) {
                                    return "Invalide cost".tr(context);
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 255, 249, 215),
                                    filled: true,
                                    hintText: "From".tr(context),
                                    border: InputBorder.none),
                                keyboardType: TextInputType.number,
                              )),
                              SizedBox(
                                width: myApplication.widthClc(context, 8),
                              ),
                              Expanded(
                                  child: TextFormField(
                                controller: myController2,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter final price"
                                        .tr(context);
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(myController2.text)) {
                                    return "Invalide cost".tr(context);
                                  } else if (num.parse(myController2.text) <=
                                      num.parse(myController1.text)) {
                                    return "final cost must be greater than initial cost"
                                        .tr(context);
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    fillColor: const Color.fromARGB(
                                        255, 255, 249, 215),
                                    filled: true,
                                    hintText: "To".tr(context),
                                    border: InputBorder.none),
                              ))
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: myApplication.hightClc(context, 8),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: myApplication.widthClc(context, 16),
                //     vertical: myApplication.hightClc(context, 16),
                //   ),
                //   color: Color(0xFFFFFFFF),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Unit Laws",
                //         style: TextStyle(
                //             fontSize: 16,
                //             fontFamily: "Tajawal",
                //             color: Color(0xFF363A3D)),
                //       ),
                //       Container(
                //           margin: EdgeInsets.only(
                //               top: myApplication.hightClc(context, 19)),
                //           child: Row(
                //             // scrollDirection: Axis.horizontal,
                //             children:
                //                 unitLawsTaps // لما كتبت الليست هارد كود هنا السيتستيت مشتغلتش!
                //                     .map((e) => InkWell(
                //                           child:
                //                               FilterTab(e["name"], e["bool"]),
                //                           onTap: () {
                //                             if (unitLawsTapsList
                //                                     .where((element) =>
                //                                         element == e["name"])
                //                                     .isNotEmpty &&
                //                                 unitLawsTapsList
                //                                         .where((element) =>
                //                                             element ==
                //                                             e["name"])
                //                                         .first ==
                //                                     e["name"]) {
                //                               setState(() {
                //                                 unitLawsTapsList
                //                                     .remove(e["name"]);
                //                                 e["bool"] = false;
                //                               });
                //                             } else {
                //                               setState(() {
                //                                 unitLawsTapsList.add(e["name"]);
                //                                 e["bool"] = true;
                //                               });
                //                             }
                //                             print(unitLawsTapsList);
                //                           },
                //                         ))
                //                     .toList(),
                //           )),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: myApplication.hightClc(context, 50),
                ),
                Container(
                  height: myApplication.hightClc(context, 45),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                      horizontal: myApplication.widthClc(context, 32)),
                  child: BlocBuilder<SearchFromHomeCubit, SearchFromHomeState>(
                    builder: (context, state) {
                      return state is SearchFromHomeLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(23))),
                                // textStyle: TextStyle(fontWeight: FontWeight.normal),
                                elevation: 0,
                                backgroundColor: const Color(0XFFDC8035),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  SearchFromHomeCubit.get(context)
                                      .userConfirmFilter(
                                          myState:
                                              stateSearchInFilter.text.isEmpty
                                                  ? ""
                                                  : stateSearchInFilter.text,
                                          contractType: contractTapsList,
                                          buildingType: filterTapsList,
                                          priceFrom: myController1.text,
                                          priceTo: myController2.text,
                                          context: context);
                                }
                              },
                              child: Center(
                                  child: Text(
                                "Confirm".tr(context),
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Tajawal",
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                            );
                    },
                  ),
                ),
                SizedBox(
                  height: myApplication.hightClc(context, 8),
                ),
                Container(
                    height: myApplication.hightClc(context, 45),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        horizontal: myApplication.widthClc(context, 32)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(23))),
                        // textStyle: TextStyle(fontWeight: FontWeight.normal),
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 196, 3, 3),
                      ),
                      onPressed: () {
                        setState(() {
                          contractTapsList = [];
                          filterTapsList = [];
                          contractTaps.forEach((element) {
                            element["bool"] = false;
                          });
                          myTaps.forEach((element) {
                            element["bool"] = false;
                          });
                          myController1.clear();
                          myController2.clear();
                        });
                      },
                      child: Center(
                          child: Text(
                        "Reset".tr(context),
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: "Tajawal",
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    )),
                SizedBox(
                  height: myApplication.hightClc(context, 8),
                ),

                // Container(
                //   margin: EdgeInsets.symmetric(
                //       horizontal: myApplication.widthClc(context, 32)),
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text(
                //       "Reset Filters",
                //       style: TextStyle(
                //           fontWeight: FontWeight.normal,
                //           fontFamily: "Tajawal",
                //           fontSize: 16,
                //           color: Color(0XFFB00020)),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
