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
  const myTextField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.obscureTxt,
      this.validator,
      this.keyBoardType,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        fillColor: Color(0xFFFFF7E999),
        filled: true,
        hintText: hint,
        // label: Padding(
        //     padding: EdgeInsets.only(top: 4.sp),
        //     child: AutoSizeText(
        //       hint!,
        //       style: TextStyle(
        //           color: Theme.of(context).colorScheme.secondary,
        //           fontSize: 14),
        //     )),
        // border: OutlineInputBorder(), // square border
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
            left: myApplication.widthClc(context, 16),
            bottom: myApplication.hightClc(context, 16)),
        prefixIcon: Container(
          margin:
              EdgeInsets.only(top: 12.sp, left: 12.sp, bottom: 12.sp, right: 6),
          child: SvgPicture.asset(prefix!),
        ),
        suffixIcon: Container(
          width: 10,
          margin: EdgeInsets.all(12),
          child: suffix,
        ),
      ),
    );
  }
}
