import 'dart:io';

import 'package:akari/data/cubits/AddAminties/AddAmintiesCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page1/ToggleTap.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/presentation/widgets/Shared/CategoryList.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../helpers/AppLocalizations.dart';

class FormPage3 extends StatefulWidget {
  final String id;
  final String category;
  FormPage3({super.key, required this.id, required this.category});

  @override
  State<FormPage3> createState() => _FormPage3State();
}

class _FormPage3State extends State<FormPage3> {
  final _formKey = GlobalKey<FormState>();
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  List<XFile> imageFileList = [];
  List<String> myAmenitesList = [];
  bool imgList = true;
  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  /////  ابلود اكتر من صورة
  // void selectImages() async {
  //   List<XFile>? selectedImages = await _picker.pickMultiImage();
  //   if (selectedImages.isNotEmpty) {
  //     imageFileList.addAll(selectedImages);
  //     setState(() {});
  //   }
  // }

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
                        "Images and amenities".tr(context),
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
                    currentStep: 3,
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
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                    // outlining container
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Media ".tr(context),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "(Add at least 5 images for your property)"
                                  .tr(context),
                              style: const TextStyle(
                                  color: Color.fromARGB(102, 6, 7, 28)),
                            )
                          ],
                        ),
                        const SizedBox(
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
                                  _pickImage();
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: const Color(0xFFF4F4F4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(plusss),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Tab to add images".tr(context),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "Tab to add images At least (240 px *240 px)"
                                              .tr(context),
                                          style: const TextStyle(fontSize: 12),
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
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: 200,
                                      width: 200,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.file(
                                            File(e.path),
                                            fit: BoxFit.cover,
                                          ),
                                          IconButton(
                                              alignment: Alignment.topLeft,
                                              onPressed: () {
                                                setState(() {
                                                  imageFileList.remove(e);
                                                });
                                              },
                                              icon: CircleAvatar(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                            255, 7, 4, 4)
                                                        .withOpacity(0.2),
                                                child: const Icon(
                                                  Icons.clear_sharp,
                                                  color: Color.fromARGB(
                                                      255, 220, 28, 15),
                                                ),
                                              ))
                                        ],
                                      )))
                                  .toList(),
                            ],
                          ),
                        ),
                        imgList == false
                            ? Text(
                                "You must upload 5 pictures at least"
                                    .tr(context),
                                style: const TextStyle(color: Colors.red),
                              )
                            : Container(),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              "Amenities".tr(context),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "(Choose amenities found in your property)"
                                  .tr(context),
                              style: const TextStyle(
                                  color: Color.fromARGB(102, 6, 7, 28)),
                            )
                          ],
                        ),

                        /////////////////
                        Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Wrap(
                                children: amenities
                                    .map((e) => InkWell(
                                          child: ToggleTap(
                                              e["name"].toString().tr(context),
                                              e["bool"]),
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
                                                print(myAmenitesList);
                                              });
                                            } else {
                                              setState(() {
                                                myAmenitesList.add(e["name"]);
                                                e["bool"] = true;
                                                print(myAmenitesList);
                                              });
                                            }
                                          },
                                        ))
                                    .toList())),
                        /////////////////
                        const Spacer(),
                        BlocBuilder<AddAmintiesCubit, AddAmintiesState>(
                          builder: (context, state) {
                            return state is AddAmintiesLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : myButton(() {
                                    if (_formKey.currentState!.validate()

                                        // &&
                                        //     imageFileList.length >= 3
                                        ) {
                                      // setState(() {
                                      //   imgList = true;
                                      // }

                                      // );

                                      AddAmintiesCubit.get(context)
                                          .userAddAminties(
                                              myAmenitesList,
                                              widget.id,
                                              CacheHelper.getFromShared(
                                                  "token"),
                                              widget.category,
                                              context);
                                    } else {
                                      setState(() {
                                        imgList = false;
                                      });
                                    }
                                  }, "continue  ➔".tr(context));
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
