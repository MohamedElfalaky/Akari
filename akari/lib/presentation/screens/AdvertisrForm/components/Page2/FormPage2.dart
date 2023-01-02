import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page1/ToggleTap.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormPage2 extends StatefulWidget {
  FormPage2({super.key});

  @override
  State<FormPage2> createState() => _FormPage2State();
}

class _FormPage2State extends State<FormPage2> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _typeList = [];
  final List<String> _deliveryTermList = [];
  final TextEditingController _titleText = TextEditingController();
  final TextEditingController _areaText = TextEditingController();
  final TextEditingController _bathRoomText = TextEditingController();
  final TextEditingController _bedRoomText = TextEditingController();
  final TextEditingController _floorText = TextEditingController();
  final TextEditingController _descriptioneText = TextEditingController();
  final TextEditingController _dateText = TextEditingController();
  DateTime defaltDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _dateText.text = "${defaltDate.year}/${defaltDate.month}/${defaltDate.day}";
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
                        "Main details",
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
                    currentStep: 2,
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
                        "2/6",
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
              children: [
                Container(
                    // outlining container
                    margin: EdgeInsets.only(left: 24, right: 24, top: 30),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      // shrinkWrap: true,
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
                                    return "Please Enter title";
                                  }
                                  return null;
                                },
                                hint: "Title *",
                                prefix: myTitle,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "(e.g. brand, model, age, type)",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(217, 85, 85, 108)),
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   height: 8,
                              // ),

//////////////////////// type
                              Text("Type *"),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  // margin: EdgeInsets.only(
                                  //     top: myApplication.hightClc(context, 19)),
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                    typeTaps // لما كتبت الليست هارد كود هنا السيتستيت مشتغلتش!
                                        .map((e) => InkWell(
                                              child: ToggleTap(
                                                  e["name"], e["bool"]),
                                              onTap: () {
                                                if (_typeList
                                                        .where((element) =>
                                                            element ==
                                                            e["name"])
                                                        .isNotEmpty &&
                                                    _typeList
                                                            .where((element) =>
                                                                element ==
                                                                e["name"])
                                                            .first ==
                                                        e["name"]) {
                                                  setState(() {
                                                    _typeList.remove(e["name"]);
                                                    e["bool"] = false;
                                                  });
                                                } else {
                                                  if (_typeList.length == 1) {
                                                  } else {
                                                    setState(() {
                                                      _typeList.add(e["name"]);
                                                      e["bool"] = true;
                                                    });
                                                  }
                                                }

                                                print(_typeList);
                                              },
                                            ))
                                        .toList(),
                              )),
/////////////////////// Type end
                              SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "Area *",
                                controller: _areaText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter area";
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only";
                                  }
                                  return null;
                                },
                                prefix: myArea,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "No. of bedrooms *",
                                controller: _bedRoomText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter No. of bedrooms";
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only";
                                  }
                                  return null;
                                },
                                prefix: myBed,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "No. of bathrooms *",
                                controller: _bathRoomText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter No. of bathrooms";
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only";
                                  }
                                  return null;
                                },
                                prefix: myBathroom,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              myTextField(
                                hint: "Floor *",
                                controller: _floorText,
                                keyBoardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter floors number";
                                  } else if (value.isNotEmpty &&
                                      !RegExp(r'(^(?:[+0]9)?[0-9])')
                                          .hasMatch(value)) {
                                    return "Please enter numbers only";
                                  }
                                  return null;
                                },
                                prefix: myStairs,
                              ),
                              SizedBox(
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
                                  hint: "Delivery date*",
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
                                  suffix: Icon(Icons.arrow_downward),
                                ),
                              ),

                              SizedBox(
                                height: 16,
                              ),
                              ////////////////////////////////////// Delivery term

                              Text("Delivery Term *"),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  // margin: EdgeInsets.only(
                                  //     top: myApplication.hightClc(context, 19)),
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                    deliveryTerm // لما كتبت الليست هارد كود هنا السيتستيت مشتغلتش!
                                        .map((e) => InkWell(
                                              child: ToggleTap(
                                                  e["name"], e["bool"]),
                                              onTap: () {
                                                if (_deliveryTermList
                                                        .where((element) =>
                                                            element ==
                                                            e["name"])
                                                        .isNotEmpty &&
                                                    _deliveryTermList
                                                            .where((element) =>
                                                                element ==
                                                                e["name"])
                                                            .first ==
                                                        e["name"]) {
                                                  setState(() {
                                                    _deliveryTermList
                                                        .remove(e["name"]);
                                                    e["bool"] = false;
                                                  });
                                                } else {
                                                  if (_deliveryTermList
                                                          .length ==
                                                      1) {
                                                  } else {
                                                    setState(() {
                                                      _deliveryTermList
                                                          .add(e["name"]);
                                                      e["bool"] = true;
                                                    });
                                                  }
                                                }

                                                print(_deliveryTermList);
                                              },
                                            ))
                                        .toList(),
                              )),
                              SizedBox(
                                height: 16,
                              ),
                              /////////////////////////////////////
                              myTextField(
                                hint: "   Description *",
                                controller: _descriptioneText,
                                keyBoardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Description";
                                  } else if (value.length < 30) {
                                    return "Description must be more than 30 characters";
                                  }
                                  return null;
                                },
                                maxLines: 8,
                                maxlenth: 2000,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "(Include condition, features and reason for selling)",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(217, 85, 85, 108)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        myButton(() {
                          if (_formKey.currentState!.validate()) {
                            print("HElooooooooooooo");
                          }
                        }, "continue  ➔"),
                        Spacer()
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}