import 'package:akari/helpers/myApplication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BestAdsItem extends StatelessWidget {
  const BestAdsItem({super.key, this.myBool});
  final bool? myBool;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: myApplication.hightClc(context, 8),
          bottom: myApplication.hightClc(context, 16)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      height: myApplication.hightClc(context, 314),
      width: myApplication.widthClc(context, 327),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      fit: BoxFit.fill),
                  // color: Colors.green,
                ),
                height: myApplication.hightClc(context, 176),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: myApplication.hightClc(context, 8),
                    left: myApplication.widthClc(context, 8)),
                height: myApplication.widthClc(context, 32),
                width: myApplication.widthClc(context, 32),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: myBool == true
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                        ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: myApplication.widthClc(context, 12),
                  vertical: myApplication.hightClc(context, 8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: myApplication.hightClc(context, 12)),
                    child: AutoSizeText(
                      "Villa five stars",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: myApplication.widthClc(context, 6),
                                  bottom: myApplication.hightClc(context, 8)),
                              height: myApplication.hightClc(context, 14),
                              width: myApplication.widthClc(context, 14),
                              child:
                                  SvgPicture.asset("assets/AdsPics/area.svg"),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: myApplication.widthClc(context, 125),
                                  bottom: myApplication.hightClc(context, 8)),
                              child: AutoSizeText(
                                "200 m",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: myApplication.widthClc(context, 6),
                                  bottom: myApplication.hightClc(context, 8)),
                              height: myApplication.hightClc(context, 14),
                              width: myApplication.widthClc(context, 14),
                              child: SvgPicture.asset(
                                  "assets/AdsPics/floor no..svg"),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: myApplication.hightClc(context, 8)),
                              child: AutoSizeText(
                                "3 floors",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 2,
                          child: Row(children: [
                            Container(
                                margin: EdgeInsets.only(
                                    right: myApplication.widthClc(context, 6),
                                    bottom: myApplication.hightClc(context, 8)),
                                height: myApplication.hightClc(context, 14),
                                width: myApplication.widthClc(context, 14),
                                child: SvgPicture.asset(
                                    "assets/AdsPics/location.svg")),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: myApplication.hightClc(context, 12)),
                              child: AutoSizeText(
                                "Sudan, Alkhartom ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ])),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  bottom: myApplication.hightClc(context, 12),
                                  right: myApplication.widthClc(context, 6),
                                ),
                                height: myApplication.hightClc(context, 14),
                                width: myApplication.widthClc(context, 14),
                                child: SvgPicture.asset(
                                    "assets/AdsPics/post date.svg")),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: myApplication.hightClc(context, 12)),
                              child: AutoSizeText(
                                "19 OCT",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: AutoSizeText(
                          "150 SD / month",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Tajawal",
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.share,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 12.sp,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
