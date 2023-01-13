import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestAdsItemInMap extends StatelessWidget {
  const BestAdsItemInMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                        fit: BoxFit.fill),
                    // color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 75,
                  width: 75,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, left: 8),
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Villa five stars",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6, bottom: 8),
                          height: 14,
                          width: 14,
                          child: SvgPicture.asset("assets/AdsPics/area.svg"),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "200 m",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6, bottom: 8),
                          height: 14,
                          width: 14,
                          child:
                              SvgPicture.asset("assets/AdsPics/floor no..svg"),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "3 floors",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                          margin: EdgeInsets.only(right: 6, bottom: 8),
                          height: 14,
                          width: 14,
                          child:
                              SvgPicture.asset("assets/AdsPics/location.svg")),
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(
                          "Sudan, Alkhartom ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              bottom: 12,
                              right: 6,
                            ),
                            height: 14,
                            width: 14,
                            child: SvgPicture.asset(
                                "assets/AdsPics/post date.svg")),
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: Text(
                            "19 OCT",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "150 SD / month",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Tajawal",
                            color: Theme.of(context).colorScheme.secondary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.share,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 16,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
