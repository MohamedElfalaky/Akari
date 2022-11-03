import 'package:akari/data/Shared/Simplify.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class myTextField extends StatelessWidget {
  final String? hint;
  final String? prefix;
  final String? suffix;
  const myTextField({this.hint, this.prefix, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Simplify.hightClc(context, 56),
      width: double.infinity,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Color(0xFFFFF7E999),
          filled: true,
          // hintText: "Email",
          label: Padding(
              padding: EdgeInsets.only(top: 4.sp),
              child: AutoSizeText(
                hint!,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14),
              )),
          border: InputBorder.none, // square border
          enabledBorder: OutlineInputBorder(
              //rounded borders
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: BorderSide(
                color: Color(0xFFFFF7E999),
              )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2)),
          contentPadding: EdgeInsets.only(
              left: Simplify.widthClc(context, 16),
              bottom: Simplify.hightClc(context, 16)),
          prefixIcon: Container(
            margin: EdgeInsets.only(
                top: 12.sp, left: 12.sp, bottom: 12.sp, right: 6),
            child: SvgPicture.asset(prefix!),
          ),
          suffixIcon: Container(
            margin: EdgeInsets.all(12.sp),
            child: SvgPicture.asset(suffix!),
          ),
        ),
      ),
    );
  }
}
