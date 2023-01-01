import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormPage1 extends StatelessWidget {
  const FormPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 2,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {},
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
        body: Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 30),
            child: Text("Page one")));
  }
}
