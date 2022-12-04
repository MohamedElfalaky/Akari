import 'package:akari/App/constants.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FilterAppBar extends StatefulWidget {
  FilterAppBar({super.key});

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

class _FilterAppBarState extends State<FilterAppBar> {
  final TextEditingController _searchText = TextEditingController();

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
              AutoSizeText(
                "Filters",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Tajawal,Medium",
                    color: Color(0xFF363A3D)),
              ),
              Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Color(0xFF363A3D),
                ),
              )
            ],
          ),
          SizedBox(
            height: myApplication.hightClc(context, 20),
          ),
          AutoSizeText(
            "State",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Tajawal",
                color: Color(0xFF363A3D).withOpacity(0.8)),
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
                            padding: EdgeInsets.only(left: 20),
                            height: 50,
                            // width: 30,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(itemData.toString())),
                          ),
                      onSuggestionSelected: (suggestion) => setState(() {
                            _searchText.text = suggestion;
                          }),
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _searchText,
                        textAlignVertical: TextAlignVertical.center,
                        // cursorWidth: 25,
                        decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            hintText: "Find your state here !",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 47, 44, 44))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(70707033))),
                            contentPadding: EdgeInsets.only(
                                left: myApplication.widthClc(context, 10),
                                bottom: myApplication.hightClc(context, 10)),
                            prefixIcon: Container(
                              margin: EdgeInsets.all(
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
