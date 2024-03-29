import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../helpers/AppLocalizations.dart';

class FormPage2 extends StatefulWidget {
  final String category;
  final String contractType;
  const FormPage2(
      {super.key, required this.category, required this.contractType});

  @override
  State<FormPage2> createState() => _FormPage2State();
}

class _FormPage2State extends State<FormPage2> {
  final _formKey = GlobalKey<FormState>();
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
  String _selectedContractType = "Finished";
  /////////
  final List<String> _contractType2 = ["Apartment", "Duplex"];
  final List<bool> _isSelected2 = [true, false];
  String _selectedContractType2 = "Apartment";
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
                              // SizedBox(
                              //   height: 8,
                              // ),

//////////////////////// type
                              Text("Type *".tr(context)),
                              const SizedBox(
                                height: 8,
                              ),
                              //////////////////////////////////////////////////////////////////////////////////
                              ToggleButtons(
                                fillColor:
                                    Theme.of(context).colorScheme.primary,
                                isSelected: _isSelected2,
                                selectedColor: Colors.white,
                                children: _contractType2
                                    .map((e) => Container(
                                        margin: const EdgeInsets.all(12),
                                        child: Text(e.tr(context))))
                                    .toList(),
                                onPressed: (newIndex) {
                                  setState(() {
                                    for (int myIndex = 0;
                                        myIndex < _isSelected2.length;
                                        myIndex++) {
                                      if (myIndex == newIndex) {
                                        _isSelected2[myIndex] = true;
                                        _selectedContractType2 =
                                            _contractType2[myIndex];
                                        print(_selectedContractType2);
                                      } else {
                                        _isSelected2[myIndex] = false;
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
                                        child: Text(e.tr(context))))
                                    .toList(),
                                onPressed: (newIndex) {
                                  setState(() {
                                    for (int myIndex = 0;
                                        myIndex < _isSelected.length;
                                        myIndex++) {
                                      if (myIndex == newIndex) {
                                        _isSelected[myIndex] = true;
                                        _selectedContractType =
                                            _contractType[myIndex];
                                        print(_selectedContractType);
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
                        myButton(() {
                          if (_formKey.currentState!.validate()) {
                            // myApplication.navigateTo(FormPage3(), context);
                          }
                        }, "continue  ➔".tr(context)),
                        const Spacer()
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
