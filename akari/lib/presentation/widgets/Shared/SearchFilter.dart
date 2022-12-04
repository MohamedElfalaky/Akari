import 'package:akari/App/constants.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchFilter extends StatefulWidget {
  final searchHandler;
  SearchFilter(this.searchHandler);

  String cityName = "Choose city";

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: myApplication.widthClc(context, 272),
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
                decoration: InputDecoration(
                    fillColor: Color(0xFFFFFFFF),
                    filled: true,
                    hintText: "Search cities here !",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Color(0XFF363A3D1A), width: 2)),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Color(0XFF363A3D1A), width: 1.5),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: myApplication.widthClc(context, 10),
                        bottom: myApplication.hightClc(context, 10)),
                    prefixIcon: InkWell(
                      onTap: () => widget.searchHandler(),
                      child: Container(
                        margin: EdgeInsets.all(
                          5,
                        ),
                        child: SvgPicture.asset(
                            "assets/search-normal-twotone.svg"),
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            width: myApplication.widthClc(context, 8),
          ),
          InkWell(
            onTap: (() => Navigator.pushNamed(context, "/filter")),
            child: SizedBox(
              width: myApplication.widthClc(context, 40),
              height: myApplication.hightClc(context, 40),
              child: SvgPicture.asset("assets/filter.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
