import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/widgets/Shared/SearchFilter.dart';
import 'package:flutter/material.dart';
import '../../../helpers/AppLocalizations.dart';

class AfterFilterAppBar extends StatelessWidget {
  const AfterFilterAppBar({super.key});

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
                "Result".tr(context),
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: "Tajawal,Medium",
                    color: Color(0xFF363A3D)),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/appmain", (route) => false),
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
          SearchFilter(() => Navigator.pushReplacement(
              //
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      const AfterFilterAndSearch("Search relust"))))
        ],
      ),
    );
  }
}
