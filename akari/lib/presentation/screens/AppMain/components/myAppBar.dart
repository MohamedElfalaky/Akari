import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/widgets/Shared/SearchFilter.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../helpers/AppLocalizations.dart';

// ignore: camel_case_types
class myAppBar extends StatelessWidget {
  const myAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Welcome".tr(context),
                style: const TextStyle(fontSize: 24, fontFamily: "Tajawal"),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  belll,
                  height: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Here you can find what you need!".tr(context),
            style: const TextStyle(fontSize: 20, fontFamily: "Tajawal"),
          ),
          SizedBox(
            height: 16,
          ),
          SearchFilter(() => Navigator.push(
              //
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      AfterFilterAndSearch("Search relust".tr(context)))))
        ],
      ),
    );
  }
}
