import 'package:akari/helpers/LocationService.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page1/ToggleTap.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/page5/FormPage5.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:location/location.dart';

class FormPage4 extends StatefulWidget {
  FormPage4({super.key});

  @override
  State<FormPage4> createState() => _FormPage4State();
}

class _FormPage4State extends State<FormPage4> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _stateText = TextEditingController();
  final TextEditingController _districtText = TextEditingController();
  final TextEditingController _detailedAddressText = TextEditingController();
  final TextEditingController _pOBox = TextEditingController();

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
                    currentStep: 4,
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
                    margin: EdgeInsets.only(left: 24, right: 24, top: 30),
                    // height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(adress1),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  getMyLocation();
                                },
                                child: SvgPicture.asset(adress2))
                          ],
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        myTextField(
                          hint: "State *",
                          controller: _stateText,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter State";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        myTextField(
                          hint: "District *",
                          controller: _districtText,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter District";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        myTextField(
                          hint: "Detailed Address *",
                          controller: _detailedAddressText,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Detailed Address";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        myTextField(
                          hint: "P. O. Box",
                          controller: _pOBox,
                          keyBoardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter P. O. Box";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 250,
                        ),

                        /////////////////////////////////////

                        myButton(() {
                          if (_formKey.currentState!.validate()) {
                            print("HElooooooooooooo");
                            myApplication.navigateTo(FormPage5(), context);
                          }
                        }, "continue  ➔"),
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  var lat;
  var long;
  var country;
  var area;
  var street;
  var wholeLocation;

  Future<LocationData> getMyLocation() async {
    _districtText.text = "Loading..";
    _stateText.text = "Loading..";
    _detailedAddressText.text = "Loading..";
    _pOBox.text = "Loading..";
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      final placeMark = await service.getPlaceMark(locationData: locationData);
      setState(() {
        _stateText.text = placeMark?.administrativeArea ?? "Loading..";
        _districtText.text = placeMark?.subAdministrativeArea ?? "Loading..";
        _detailedAddressText.text = placeMark?.street ?? "Loading..";
        _pOBox.text = placeMark?.postalCode ?? "Loading..";
      });
    }
    return locationData!;
  }
}
