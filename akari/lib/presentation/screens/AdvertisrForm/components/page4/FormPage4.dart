import 'package:akari/data/cubits/addAddress/AddAmintiesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/LocationService.dart';

import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../helpers/AppLocalizations.dart';

class FormPage4 extends StatefulWidget {
  final String id;
  final String category;
  const FormPage4({super.key, required this.id, required this.category});

  @override
  State<FormPage4> createState() => _FormPage4State();
}

class _FormPage4State extends State<FormPage4> {
  final _formKey = GlobalKey<FormState>();

  // final TextEditingController _stateText = TextEditingController();
  final TextEditingController _districtText = TextEditingController();
  final TextEditingController _detailedAddressText = TextEditingController();
  final TextEditingController _pOBox = TextEditingController();
  String? _dropDownValue;

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
                        "Address & Price details".tr(context),
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
                    currentStep: 4,
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
                        "4/6",
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
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
                    // height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(adress1),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Address".tr(context),
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  getMyLocation();
                                },
                                child: SvgPicture.asset(adress2))
                          ],
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Container(
                          // dropdown menu container
                          // padding: EdgeInsets.all(5),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              fillColor: Color(0xffFFF7E999),
                              filled: true,
                              border: InputBorder.none, // شلت البوردر
                            ),
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    categoryBulk,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("States".tr(context)),
                                  const Text(
                                    " *",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                            isExpanded: true,
                            // icon: SvgPicture.asset(dropDownArrow),
                            onChanged: (val) {
                              setState(() {
                                _dropDownValue = val.toString();
                              });
                            },
                            value: _dropDownValue,
                            items: appStates.map((e) {
                              return DropdownMenuItem(value: e, child: Text(e));
                            }).toList(),
                            validator: (value) {
                              if (_dropDownValue == null) {
                                return "You must select a state".tr(context);
                              }
                              ;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        myTextField(
                          hint: "District *".tr(context),
                          controller: _districtText,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter District".tr(context);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        myTextField(
                          hint: "Detailed Address *".tr(context),
                          controller: _detailedAddressText,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Detailed Address"
                                  .tr(context)
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        myTextField(
                          hint: "P. O. Box".tr(context),
                          controller: _pOBox,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter P. O. Box".tr(context);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 250,
                        ),

                        /////////////////////////////////////

                        BlocBuilder<addAddressCubit, addAddressState>(
                          builder: (context, state) {
                            return state is addAddressLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : myButton(() {
                                    if (_formKey.currentState!.validate()) {
                                      // myApplication.navigateTo(FormPage5(), context);
                                      addAddressCubit
                                          .get(context)
                                          .useraddAddress(
                                              _dropDownValue!,
                                              _districtText.text,
                                              _detailedAddressText.text,
                                              _pOBox.text,
                                              widget.id,
                                              CacheHelper.getFromShared(
                                                  "token"),
                                              widget.category,
                                              context);
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

  // var lat;
  // var long;
  // var country;
  // var area;
  // var street;
  // var wholeLocation;

  Future<LocationData> getMyLocation() async {
    // _stateText.text = "Loading..";

    _districtText.text = "Loading..".tr(context);
    _detailedAddressText.text = "Loading..".tr(context);
    _pOBox.text = "Loading..".tr(context);
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      final placeMark = await service.getPlaceMark(locationData: locationData);
      setState(() {
        // _stateText.text = placeMark?.administrativeArea ?? "Loading..";
        _districtText.text =
            placeMark?.subAdministrativeArea ?? "Loading..".tr(context);
        _detailedAddressText.text =
            placeMark?.street ?? "Loading..".tr(context);
        _pOBox.text = placeMark?.postalCode ?? "Loading..".tr(context);
      });
    }
    return locationData!;
  }
}
