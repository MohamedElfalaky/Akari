import 'package:akari/data/cubits/Page1/Page1Cubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../helpers/AppLocalizations.dart';

class FormPage1 extends StatefulWidget {
  FormPage1({super.key});

  @override
  State<FormPage1> createState() => _FormPage1State();
}

class _FormPage1State extends State<FormPage1> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _contractType = ["Rent", "Investment", "Selling"];
  final List<bool> _isSelected = [true, false, false];

  ///////////
  String? dropDownValue;
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
                  currentStep: 1,
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
              margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              categoryBulk,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Categories".tr(context)),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(e["name"].toString().tr(context)),
                              ],
                            ));
                      }).toList(),
                      validator: (value) {
                        if (dropDownValue == null) {
                          return "You must select a category".tr(context);
                        } else if (dropDownValue != "Apartment, Duplex" &&
                            dropDownValue != "Villa") {
                          return "Only Appartments, Duplex and Villas are available now to be advertised"
                              .tr(context);
                        }
                        ;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        "This property for:".tr(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  /////////////////////////////////////////////////////////////////////////////////

                  ToggleButtons(
                    fillColor: Theme.of(context).colorScheme.primary,
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
                  const Spacer(
                    flex: 10,
                  ),
                  BlocBuilder<Page1Cubit, Page1State>(
                    builder: (context, state) {
                      return state is Page1Loading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : myButton(() {
                              if (_formKey.currentState!.validate()) {
                                Page1Cubit.get(context).userPage1(
                                    dropDownValue!,
                                    _selectedContractType,
                                    CacheHelper.getFromShared("token"),
                                    context);
                              }
                            }, "continue  ➔");
                    },
                  ),
                  const Spacer(
                      // flex: 1,
                      )
                ],
              )),
        ));
  }
}
