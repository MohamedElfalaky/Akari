import 'dart:io';

import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page1/ToggleTap.dart';
import 'package:akari/presentation/widgets/Filter/FilterTab.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/presentation/widgets/Shared/TextField.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormPage3 extends StatefulWidget {
  FormPage3({super.key});

  @override
  State<FormPage3> createState() => _FormPage3State();
}

class _FormPage3State extends State<FormPage3> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  List<String> myAmenitesList = [];
  void selectImages() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      setState(() {});
    }
  }

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
                        "Images and amenities",
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
                    currentStep: 3,
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
                        "3/6",
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
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                    // outlining container
                    margin: EdgeInsets.only(left: 24, right: 24, top: 30),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Media ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "(Add at least 5 images for your property)",
                              style: TextStyle(
                                  color: Color.fromARGB(102, 6, 7, 28)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 210,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ////////////////// زرار اضافة الصور
                              InkWell(
                                onTap: () {
                                  selectImages();
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: Color(0xFFF4F4F4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(plusss),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Tab to add images",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "Tab to add images At least (240 px *240 px)",
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ////////////////////////// بماب ع الصور اللي اترفعت
                              ...imageFileList
                                  .map((e) => Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      height: 200,
                                      width: 200,
                                      child: Image.file(
                                        File(e.path),
                                        fit: BoxFit.cover,
                                      )))
                                  .toList(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            Text(
                              "Amenities",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "(Choose amenities found in your property)",
                              style: TextStyle(
                                  color: Color.fromARGB(102, 6, 7, 28)),
                            )
                          ],
                        ),

                        /////////////////
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Wrap(
                                children: amenities
                                    .map((e) => InkWell(
                                          child:
                                              ToggleTap(e["name"], e["bool"]),
                                          onTap: () {
                                            if (myAmenitesList
                                                    .where((element) =>
                                                        element == e["name"])
                                                    .isNotEmpty &&
                                                myAmenitesList
                                                        .where((element) =>
                                                            element ==
                                                            e["name"])
                                                        .first ==
                                                    e["name"]) {
                                              setState(() {
                                                myAmenitesList
                                                    .remove(e["name"]);
                                                e["bool"] = false;
                                              });
                                            } else {
                                              setState(() {
                                                myAmenitesList.add(e["name"]);
                                                e["bool"] = true;
                                              });
                                            }
                                          },
                                        ))
                                    .toList())),
                        /////////////////
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
