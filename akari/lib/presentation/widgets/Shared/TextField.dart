import 'package:akari/helpers/myApplication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class myTextField extends StatelessWidget {
  final String? hint;
  final String? prefix;
  final suffix;
  final bool? obscureTxt;
  final String? Function(String?)? validator;
  final keyBoardType;
  final TextEditingController? controller;
  final clr;
  final maxLines;
  final minLines;
  final maxlenth;
  final enabled;
  const myTextField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.obscureTxt,
      this.validator,
      this.keyBoardType,
      this.controller,
      this.clr,
      this.maxLines,
      this.minLines,
      this.maxlenth,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? maxLines,
      maxLength: maxlenth,
      // height: 60,    // ميتقيدش بحجم عشان ميبوظش وقت الايرور
      // width: double.infinity,
      controller: controller,
      keyboardType: keyBoardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureTxt ?? false,
      textAlignVertical: TextAlignVertical.bottom,
      cursorHeight: 25,
      decoration: InputDecoration(
        fillColor: clr ?? Color(0xFFFFF7E999),
        filled: true,
        hintText: hint,
        label: Padding(
            padding: EdgeInsets.only(top: 4),
            child: AutoSizeText(
              hint ?? "",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 14),
            )),
        // border: OutlineInputBorder(), // square border
        enabledBorder: OutlineInputBorder(
            //rounded borders
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: clr ?? Color(0xFFFFF7E999),
            )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 2)),
        contentPadding: EdgeInsets.only(
            left: myApplication.widthClc(context, 16),
            bottom: myApplication.hightClc(context, 12),
            top: myApplication.hightClc(context, 12)),
        prefixIcon: prefix != null
            ? Container(
                margin:
                    EdgeInsets.only(top: 12, left: 12, bottom: 12, right: 6),
                child: SvgPicture.asset(prefix ?? ""),
              )
            : null,
        suffixIcon: Container(
          width: 10,
          margin: EdgeInsets.all(12),
          child: suffix ?? Container(),
        ),
      ),
    );
  }
}
