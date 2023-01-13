// ignore_for_file: must_be_immutable

import 'package:akari/data/cubits/Page2Appartment/Page2AppartmentCubit.dart';
import 'package:akari/data/cubits/Page2Villa/Page2VillaCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';

import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../helpers/AppLocalizations.dart';

class P2VillaAppartment extends StatefulWidget {
  final String category;
  final String contractType;
  final String id;
  List<String> contractType2;
  List<bool> isSelected2;
  String selectedSubType;
  P2VillaAppartment(
      {super.key,
      required this.category,
      required this.contractType,
      required this.id,
      required this.contractType2,
      required this.isSelected2,
      required this.selectedSubType});

  @override
  State<P2VillaAppartment> createState() => _P2VillaAppartmentState();
}

class _P2VillaAppartmentState extends State<P2VillaAppartment> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _rentPeriods = [];
  final TextEditingController _titleText = TextEditingController();
  final TextEditingController _areaText = TextEditingController();
  final TextEditingController _bathRoomText = TextEditingController();
  final TextEditingController _bedRoomText = TextEditingController();
  final TextEditingController _floorText = TextEditingController();
  final TextEditingController _descriptioneText = TextEditingController();
  final TextEditingController _dateText = TextEditingController();
  DateTime defaltDate = DateTime.now();

  ///////
  final List<String> _contractType = [
    "Finished",
    "Semi-Finished",
    "Not Finished"
  ];
  final List<bool> _isSelected = [true, false, false];
  String _selectedDeliveryTerm = "Finished";
  /////////

  ////////
  final List<String> _selections3 = [
    "Singles",
    "Families",
    "Singles & Families"
  ];
  final List<bool> _isSelected3 = [true, false, false];
  String _selected3 = "Singles";
/////////
  bool _daily = false;
  bool _monthly = false;
  bool _yearly = false;
  bool _Any = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dateText.text = "${defaltDate.year}-${defaltDate.month}-${defaltDate.day}";
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
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Post new Ad.".tr(context),
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Tajawal",
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Main details".tr(context),
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Tajawal",
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
                const Spacer(),
                CircularStepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 2,
                  stepSize: 5,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  unselectedColor: Colors.grey[300],
                  padding: 0,
                  width: 50,
                  height: 50,
                  selectedStepSize: 5,
                  roundedCap: (_, __) => true,
                  child: const Center(
                    child: Text(
                      "2/6",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                    // outlining container
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.68,
                          child: ListView(
                            children: [
                              myTextField(
                                controller: _titleText,
                                keyBoardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter title".tr(context);
                                  }
                                  return null;
                                },
                                hint: "Title *".tr(context),
                                prefix: myTitle,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "(e.g. brand, model, age, type)"
                                        .tr(context),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(217, 85, 85, 108)),
                                  )
                                ],
                              ),

                              Text("Type *".tr(context)),
                              const SizedBox(
                                height: 8,
                              ),
                              //////////////////////////////////////////////////////////////////////////////////
                              ToggleButtons(
                                fillColor:
                                    Theme.of(context).colorScheme.primary,
                                isSelected: widget.isSelected2,
                                selectedColor: Colors.white,
                                children: widget.contractType2
                                    .map((e) => Container(
                                        margin: const EdgeInsets.all(12),
                                        child: Text(e.tr(context))))
                                    .toList(),
                                onPressed: (newIndex) {
                                  setState(() {
                                    for (int myIndex = 0;
                                        myIndex < widget.isSelected2.length;
                                        myIndex++) {
                                      if (myIndex == newIndex) {
                                        widget.isSelected2[myIndex] = true;
                                        widget.selectedSubType =
                                            widget.contractType2[myIndex];
                                        // print(widget.contractType2[myIndex]);
                                        print(widget.selectedSubType);
                                      } else {
                                        widget.isSelected2[myIndex] = false;
                                      }
                                    }
                                  });
                                },
                              ),

                              //////////////////////////////////////////////////////////////////////////////////
                              const SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "Area *".tr(context),
                                controller: _areaText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter area".tr(context);
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only"
                                        .tr(context);
                                  }
                                  return null;
                                },
                                prefix: myArea,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "No. of bedrooms *".tr(context),
                                controller: _bedRoomText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter No. of bedrooms"
                                        .tr(context);
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only"
                                        .tr(context);
                                  }
                                  return null;
                                },
                                prefix: myBed,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "No. of bathrooms *".tr(context),
                                controller: _bathRoomText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter No. of bathrooms"
                                        .tr(context);
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only"
                                        .tr(context);
                                  }
                                  return null;
                                },
                                prefix: myBathroom,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "Floor *".tr(context),
                                controller: _floorText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter floors number"
                                        .tr(context);
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only"
                                        .tr(context);
                                  }
                                  return null;
                                },
                                prefix: myStairs,
                              ),
                              const SizedBox(
                                height: 16,
                              ),

                              InkWell(
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: defaltDate,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100));
                                  if (newDate != null) {
                                    setState(() {
                                      defaltDate = newDate;
                                    });
                                  }
                                },
                                child: myTextField(
                                  hint: "Delivery date*".tr(context),
                                  enabled: false,
                                  controller: _dateText,
                                  // keyBoardType: TextInputType.number,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please Enter delivery date";
                                  //   }
                                  //   return null;
                                  // },
                                  // hint: "Delivery date* - eg.(24-11-2020)",
                                  prefix: myDate,
                                  suffix: const Icon(Icons.arrow_downward),
                                ),
                              ),

                              const SizedBox(
                                height: 16,
                              ),
                              ////////////////////////////////////// Delivery term

                              Text("Delivery Term *".tr(context)),
                              const SizedBox(
                                height: 8,
                              ),

                              ToggleButtons(
                                fillColor:
                                    Theme.of(context).colorScheme.primary,
                                isSelected: _isSelected,
                                selectedColor: Colors.white,
                                children: _contractType
                                    .map((e) => Container(
                                        margin: const EdgeInsets.all(12),
                                        child: Text(e)))
                                    .toList(),
                                onPressed: (newIndex) {
                                  setState(() {
                                    for (int myIndex = 0;
                                        myIndex < _isSelected.length;
                                        myIndex++) {
                                      if (myIndex == newIndex) {
                                        _isSelected[myIndex] = true;
                                        _selectedDeliveryTerm =
                                            _contractType[myIndex];
                                        print(_selectedDeliveryTerm);
                                      } else {
                                        _isSelected[myIndex] = false;
                                      }
                                    }
                                  });
                                },
                              ),

                              const SizedBox(
                                height: 16,
                              ),
                              /////////////////////////////////////
                              widget.contractType == "Rent"
                                  ?

                                  ////

                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Who can rent *".tr(context)),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        ToggleButtons(
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          isSelected: _isSelected3,
                                          selectedColor: Colors.white,
                                          children: _selections3
                                              .map((e) => Container(
                                                  margin:
                                                      const EdgeInsets.all(12),
                                                  child: Text(e.tr(context))))
                                              .toList(),
                                          onPressed: (newIndex) {
                                            setState(() {
                                              for (int myIndex = 0;
                                                  myIndex < _isSelected3.length;
                                                  myIndex++) {
                                                if (myIndex == newIndex) {
                                                  _isSelected3[myIndex] = true;
                                                  _selected3 =
                                                      _selections3[myIndex];
                                                  print(_selected3);
                                                } else {
                                                  _isSelected3[myIndex] = false;
                                                }
                                              }
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text("Can be rented *".tr(context)),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Checkbox(
                                                    activeColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    value: _daily,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _daily = value!;
                                                      });
                                                      if (_daily == true) {
                                                        _rentPeriods
                                                            .add("Daily");
                                                      } else {
                                                        _rentPeriods
                                                            .remove("Daily");
                                                      }
                                                      print(_rentPeriods);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Daily".tr(context),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Tajawal"),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 47,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Checkbox(
                                                    activeColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    value: _monthly,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _monthly = value!;
                                                      });
                                                      if (_monthly == true) {
                                                        _rentPeriods
                                                            .add("Monthly");
                                                      } else {
                                                        _rentPeriods
                                                            .remove("Monthly");
                                                      }
                                                      print(_rentPeriods);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Monthly".tr(context),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Tajawal"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        ////////////////////////////////////////////////////////////////// Check box 2
                                        Row(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Checkbox(
                                                    activeColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    value: _yearly,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _yearly = value!;
                                                      });
                                                      if (_yearly == true) {
                                                        _rentPeriods
                                                            .add("Yearly");
                                                      } else {
                                                        _rentPeriods
                                                            .remove("Yearly");
                                                      }
                                                      print(_rentPeriods);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Yearly".tr(context),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Tajawal"),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Checkbox(
                                                    activeColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    value: _Any,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _Any = value!;
                                                      });
                                                      if (_Any == true) {
                                                        _rentPeriods
                                                            .add("Any period");
                                                      } else {
                                                        _rentPeriods.remove(
                                                            "Any period");
                                                      }
                                                      print(_rentPeriods);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Any period".tr(context),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Tajawal"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        ///////////////////
                                        const SizedBox(
                                          height: 12,
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                              myTextField(
                                hint: "Description *".tr(context),
                                controller: _descriptioneText,
                                keyBoardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Description"
                                        .tr(context);
                                  } else if (value.length < 30) {
                                    return "Description must be more than 30 characters"
                                        .tr(context);
                                  }
                                  return null;
                                },
                                maxLines: 6,
                                maxlenth: 2000,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "(Include condition, features and reason for selling)"
                                        .tr(context),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(217, 85, 85, 108)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        BlocBuilder<Page2AppartmentCubit, Page2AppartmentState>(
                          builder: (context, state) {
                            return state is Page2AppartmentLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : myButton(() {
                                    if (_formKey.currentState!.validate()) {
                                      widget.category == "Apartment, Duplex"
                                          ? Page2AppartmentCubit.get(context)
                                              .userPage2Appartment(
                                                  _titleText.text,
                                                  widget.selectedSubType,
                                                  int.parse(_areaText.text),
                                                  int.parse(_bedRoomText.text),
                                                  int.parse(_bathRoomText.text),
                                                  int.parse(_floorText.text),
                                                  _selectedDeliveryTerm,
                                                  _selected3,
                                                  _rentPeriods.isEmpty
                                                      ? ["Any period"]
                                                      : _rentPeriods,
                                                  _descriptioneText.text,
                                                  widget.id,
                                                  CacheHelper.getFromShared(
                                                      "token"),
                                                  widget.category,
                                                  context)
                                          : Page2VillaCubit.get(context)
                                              .userPage2Villa(
                                                  _titleText.text,
                                                  widget.selectedSubType,
                                                  int.parse(_areaText.text),
                                                  int.parse(_bedRoomText.text),
                                                  int.parse(_bathRoomText.text),
                                                  int.parse(_floorText.text),
                                                  _selectedDeliveryTerm,
                                                  _selected3,
                                                  _rentPeriods.isEmpty
                                                      ? ["Any period"]
                                                      : _rentPeriods,
                                                  _descriptioneText.text,
                                                  widget.id,
                                                  CacheHelper.getFromShared(
                                                      "token"),
                                                  widget.category,
                                                  context);
                                    }
                                  }, "continue  ➔");
                          },
                        ),
                        const Spacer()
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
