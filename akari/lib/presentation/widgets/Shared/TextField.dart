// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:akari/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  final bool? isLabled;
  const myTextField(
      {super.key,
      this.hint,
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
      this.enabled,
      this.isLabled});

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
      textAlignVertical: TextAlignVertical.center,
      cursorHeight: 25,
      decoration: InputDecoration(
        fillColor: clr ?? const Color(0xFFFFF7E999),
        filled: true,
        hintText: hint,
        label: isLabled == false
            ? const Text("")
            : Text(
                hint ?? "",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
        // border: OutlineInputBorder(), // square border
        // enabledBorder: OutlineInputBorder(
        //     //rounded borders

        //     borderRadius: BorderRadius.circular(1),
        //     borderSide: BorderSide(
        //       color: clr ?? Color(0xFFFFF7E999),
        //     )),
        // disabledBorder: OutlineInputBorder(
        //     //rounded borders

        //     borderRadius: BorderRadius.circular(1),
        //     borderSide: BorderSide(
        //       color: clr ?? Color(0xFFFFF7E999),
        //     )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 2)),

        contentPadding: EdgeInsets.only(
            left: myApplication.widthClc(context, 16),
            bottom: myApplication.hightClc(context, 12),
            top: myApplication.hightClc(context, 12)),
        prefixIcon: prefix != null
            ? Container(
                margin: const EdgeInsets.only(
                    top: 12, left: 12, bottom: 12, right: 6),
                child: SvgPicture.asset(prefix ?? ""),
              )
            : null,
        suffixIcon: Container(
          width: 10,
          margin: const EdgeInsets.all(12),
          child: suffix ?? Container(),
        ),
      ),
    );
  }
}
