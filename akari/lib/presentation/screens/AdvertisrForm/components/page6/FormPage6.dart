import 'package:akari/data/cubits/ConfirmAdd/ConfirmAddCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/TAC/TAC.dart';

import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../helpers/AppLocalizations.dart';

class FormPage6 extends StatefulWidget {
  final String id;
  final String category;
  const FormPage6({super.key, required this.id, required this.category});

  @override
  State<FormPage6> createState() => _FormPage6State();
}

class _FormPage6State extends State<FormPage6> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameText =
      TextEditingController(text: CacheHelper.getFromShared("name"));
  final TextEditingController _mobileNumberText =
      TextEditingController(text: CacheHelper.getFromShared("phone"));
  bool confirmTerms = false;
  final List<String> _yourcapacity = [
    "Owner",
    "Advertiser",
    "Representative",
  ];
  final List<bool> _isSelected = [true, false, false];

  String capacityValue = "Owner";
  //////////////

  final List<String> _yourcapacity2 = [
    "Chat",
    "Call",
    "WhatsApp",
    "All",
  ];
  final List<bool> _isSelected2 = [true, false, false, false];

  String capacityValue2 = "Chat";
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
                      "Advertiser details",
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
                  currentStep: 6,
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
                      "6/6",
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
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
                    // height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                          "Review your details".tr(context),
                          style: const TextStyle(
                            fontSize: 16,
                            // fontFamily: "Tajawal",
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        myTextField(
                          prefix: usrr,
                          hint: "Name *".tr(context),
                          controller: _nameText,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your name".tr(context);
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        myTextField(
                          prefix: calll,
                          hint: "Mobile Number *".tr(context),
                          controller: _mobileNumberText,
                          keyBoardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Mobile Number"
                                  .tr(context);
                            } else if (value.isNotEmpty &&
                                !RegExp(r'(^(?:[+0]9)?[0-9]{11}$)')
                                    .hasMatch(value)) {
                              return "Invalide mobile number".tr(context);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        ////////////////////////////////////////////////////////////////////////////////

                        ////////////////////////////////////////////////////////////////////////////////

                        Text(
                          "Your capacity".tr(context),
                          style: const TextStyle(
                            fontSize: 16,
                            // fontFamily: "Tajawal",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        ToggleButtons(
                          fillColor: Theme.of(context).colorScheme.primary,
                          isSelected: _isSelected,
                          selectedColor: Colors.white,
                          //  _yourcapacity
                          //     .map((e) => bool.fromEnvironment(e["myBool"]))
                          //     .toList(),
                          children: _yourcapacity
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
                                  capacityValue = _yourcapacity[myIndex];
                                  print(capacityValue);
                                } else {
                                  _isSelected[myIndex] = false;
                                }
                              }
                            });
                          },
                        ),

                        /////////////////////////////////////////////////////////////

                        ////////////////////////////////////////////////////////////////////////////////
                        const SizedBox(
                          height: 26,
                        ),
                        Text(
                          "Contact Method".tr(context),
                          style: const TextStyle(
                            fontSize: 16,
                            // fontFamily: "Tajawal",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        ToggleButtons(
                          fillColor: Theme.of(context).colorScheme.primary,
                          isSelected: _isSelected2,
                          selectedColor: Colors.white,
                          //  _yourcapacity
                          //     .map((e) => bool.fromEnvironment(e["myBool"]))
                          //     .toList(),
                          children: _yourcapacity2
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
                                  capacityValue2 = _yourcapacity2[myIndex];
                                } else {
                                  _isSelected2[myIndex] = false;
                                }
                              }
                            });
                          },
                        ),

                        /////////////////////////////////////////////////////////////

                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                value: confirmTerms,
                                onChanged: (value) {
                                  setState(() {
                                    confirmTerms = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "I have read and accepted all "
                                          .tr(context),
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: "Tajawal"),
                                    ),
                                    InkWell(
                                      onTap: () => myApplication.navigateTo(
                                          const TAC(), context),
                                      child: Text(
                                        "Terms and Conditions ".tr(context),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Tajawal",
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "of Smart Building ".tr(context),
                                  style: const TextStyle(
                                      fontSize: 16, fontFamily: "Tajawal"),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        confirmTerms == false
                            ? Text(
                                "You must confirm terms and conditions"
                                    .tr(context),
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              )
                            : Container(),

                        const SizedBox(
                          height: 180,
                        ),

                        /////////////////////////////////////

                        BlocBuilder<ConfirmAddCubit, ConfirmAddState>(
                          builder: (context, state) {
                            return state is ConfirmAddLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : myButton(() {
                                    if (_formKey.currentState!.validate() &&
                                        confirmTerms == true) {
                                      ConfirmAddCubit.get(context)
                                          .userConfirmAdd(
                                              name: _nameText.text,
                                              mobileNumber:
                                                  _mobileNumberText.text,
                                              capacity: capacityValue,
                                              contactMethod: capacityValue2,
                                              termsAccepted: confirmTerms,
                                              id: widget.id,
                                              token: CacheHelper.getFromShared(
                                                  "token"),
                                              category: widget.category,
                                              context: context);
                                    } else if (confirmTerms == false) {
                                      setState(() {
                                        confirmTerms = false;
                                      });
                                    }
                                  }, "continue  ➔".tr(context));
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
