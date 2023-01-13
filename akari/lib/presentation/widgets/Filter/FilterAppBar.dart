import 'package:akari/App/constants.dart';
import 'package:akari/helpers/myApplication.dart';
import '../../../helpers/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FilterAppBar extends StatefulWidget {
  const FilterAppBar({super.key});

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

final TextEditingController stateSearchInFilter = TextEditingController();

class _FilterAppBarState extends State<FilterAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: myApplication.widthClc(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Filters".tr(context),
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: "Tajawal,Medium",
                    color: Color(0xFF363A3D)),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  color: Color(0xFF363A3D),
                ),
              )
            ],
          ),
          SizedBox(
            height: myApplication.hightClc(context, 20),
          ),
          Text(
            "State".tr(context),
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Tajawal",
                color: const Color(0xFF363A3D).withOpacity(0.8)),
          ),
          SizedBox(
            height: myApplication.hightClc(context, 4),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: myApplication.widthClc(context, 320),
                  height: myApplication.hightClc(context, 40),
                  child: TypeAheadFormField(
                      suggestionsCallback: (pattern) => getSuggestion(pattern),
                      itemBuilder: (context, itemData) => Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 50,
                            // width: 30,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(itemData.toString())),
                          ),
                      onSuggestionSelected: (suggestion) => setState(() {
                            stateSearchInFilter.text = suggestion;
                          }),
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: stateSearchInFilter,
                        textAlignVertical: TextAlignVertical.center,
                        // cursorWidth: 25,
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFFFFFFF),
                            filled: true,
                            hintText: "Find your state here !".tr(context),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 47, 44, 44))),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(70707033))),
                            contentPadding: EdgeInsets.only(
                                left: myApplication.widthClc(context, 10),
                                bottom: myApplication.hightClc(context, 10)),
                            prefixIcon: Container(
                              margin: const EdgeInsets.all(
                                5,
                              ),
                              child: SvgPicture.asset(
                                  "assets/search-normal-twotone.svg"),
                            )),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
