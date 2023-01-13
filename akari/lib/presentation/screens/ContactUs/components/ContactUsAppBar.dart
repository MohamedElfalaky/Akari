import 'package:akari/helpers/myApplication.dart';
import '../../../../helpers/AppLocalizations.dart';
import 'package:flutter/material.dart';

class ContactUsAppBar extends StatelessWidget {
  const ContactUsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: myApplication.hightClc(context, 52),
            width: myApplication.widthClc(context, 48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.5),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  size: 30, color: Colors.black.withOpacity(0.6)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SizedBox(
            // width: 160,
            child: Text("Contact Us".tr(context),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.clip),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.5),
            ),
            height: myApplication.hightClc(context, 52),
            width: myApplication.widthClc(context, 48),
            padding: const EdgeInsets.all(6),
            child: InkWell(
              // onTap: () => myApplication.navigateTo(Home(), context),
              child: Icon(
                Icons.home,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
