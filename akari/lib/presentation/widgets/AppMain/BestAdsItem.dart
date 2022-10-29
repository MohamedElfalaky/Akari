import 'package:akari/data/Shared/Simplify.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BestAdsItem extends StatelessWidget {
  const BestAdsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Simplify.hightClc(context, 8),
          bottom: Simplify.hightClc(context, 16)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      height: Simplify.hightClc(context, 314),
      width: Simplify.widthClc(context, 327),
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
                height: Simplify.hightClc(context, 176),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Simplify.hightClc(context, 8),
                    left: Simplify.widthClc(context, 8)),
                height: Simplify.widthClc(context, 32),
                width: Simplify.widthClc(context, 32),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
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
                  horizontal: Simplify.widthClc(context, 12),
                  vertical: Simplify.hightClc(context, 8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(bottom: Simplify.hightClc(context, 12)),
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
                                  right: Simplify.widthClc(context, 6)),
                              height: Simplify.hightClc(context, 14),
                              width: Simplify.widthClc(context, 14),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: Simplify.widthClc(context, 125),
                                  bottom: Simplify.hightClc(context, 8)),
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
                                  right: Simplify.widthClc(context, 6)),
                              height: Simplify.hightClc(context, 14),
                              width: Simplify.widthClc(context, 14),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: Simplify.hightClc(context, 8)),
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
                                  right: Simplify.widthClc(context, 6)),
                              height: Simplify.hightClc(context, 14),
                              width: Simplify.widthClc(context, 14),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: Simplify.hightClc(context, 12)),
                              child: AutoSizeText(
                                "Nasr City, Alkhartom",
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
                                  bottom: Simplify.hightClc(context, 20),
                                  right: Simplify.widthClc(context, 6)),
                              height: Simplify.hightClc(context, 14),
                              width: Simplify.widthClc(context, 14),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: Simplify.hightClc(context, 12)),
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
                              fontSize: 18,
                              fontFamily: "Tajawal",
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.share,
                        color: Theme.of(context).colorScheme.secondary,
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
