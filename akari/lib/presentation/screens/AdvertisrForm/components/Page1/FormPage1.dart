import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page1/ToggleTap.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page2/FormPage2.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormPage1 extends StatefulWidget {
  FormPage1({super.key});

  @override
  State<FormPage1> createState() => _FormPage1State();
}

class _FormPage1State extends State<FormPage1> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _contractTapsList = [];
  String? dropDownValue;
  bool togelValidation = true;

  List<String> _contractType = ["Rent", "Investment", "Selling"];
  List<bool> _isSelected = [true, false, false];
  String _selectedContractType = "Rent";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  currentStep: 1,
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
                      "1/6",
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
          child: Container(
              // outlining container
              margin: EdgeInsets.only(left: 24, right: 24, top: 30),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // dropdown menu container
                    // padding: EdgeInsets.all(5),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        fillColor: Color(0xffFFF7E999),
                        filled: true,
                        border: InputBorder.none, // شلت البوردر
                      ),
                      hint: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              categoryBulk,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Categories"),
                            Text(
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
                          dropDownValue = val.toString();
                        });
                      },
                      value: dropDownValue,
                      items: categoryDropDown.map((e) {
                        return DropdownMenuItem(
                            value: e["name"],
                            child: Row(
                              children: [
                                SvgPicture.asset(e["img"]),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(e["name"]),
                              ],
                            ));
                      }).toList(),
                      validator: (value) {
                        if (dropDownValue == null) {
                          return "You must select a category";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        "This property for:",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  /////////////////////////////////////////////////////////////////////////////////

                  ToggleButtons(
                    fillColor: Theme.of(context).colorScheme.primary,
                    isSelected: _isSelected,
                    selectedColor: Colors.white,
                    children: _contractType
                        .map((e) => Container(
                            margin: const EdgeInsets.all(12), child: Text(e)))
                        .toList(),
                    onPressed: (newIndex) {
                      setState(() {
                        for (int myIndex = 0;
                            myIndex < _isSelected.length;
                            myIndex++) {
                          if (myIndex == newIndex) {
                            _isSelected[myIndex] = true;
                            _selectedContractType = _contractType[myIndex];
                            print(_selectedContractType);
                          } else {
                            _isSelected[myIndex] = false;
                          }
                        }
                      });
                    },
                  ),

                  /////////////////////////////////////////////////////////////////////////////
                  Spacer(
                    flex: 10,
                  ),
                  myButton(() {
                    if (_contractTapsList.isEmpty) {
                      setState(() {
                        togelValidation = false;
                      });
                    } else {
                      setState(() {
                        togelValidation = true;
                      });
                    }

                    if (_formKey.currentState!.validate()) {
                      print("HElooooo");
                      myApplication.navigateTo(FormPage2(), context);
                    }
                  }, "continue  ➔"),
                  Spacer(
                      // flex: 1,
                      )
                ],
              )),
        ));
  }
}
