import 'package:akari/data/cubits/AddToFavorite/AddToFavoriteCubit.dart';
import 'package:akari/data/cubits/RemoveFromFavorite/RemoveFromFavoriteCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/SorryPopUp.dart';
import 'package:akari/presentation/widgets/ForgetPassword/ResetMail.dart';
import 'package:akari/style/Icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class BestAdsItem extends StatelessWidget {
  final String? img;
  final String? title;
  final String? area;
  final String? floors;
  final String? statee;
  final DateTime? createdAt;
  final String? price;
  final String? priceDollar;
  final String? adId;
  final bool? isFavorite;

  const BestAdsItem(
      {super.key,
      this.img,
      this.title,
      this.area,
      this.floors,
      this.statee,
      this.createdAt,
      this.price,
      this.priceDollar,
      this.adId,
      this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      height: 380,
      width: 330,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(img ?? defaultHouse),
                      fit: BoxFit.fill),
                  // color: Colors.green,
                ),
                height: myApplication.hightClc(context, 176),
              ),
              // isFavorite != null
              //     ?
              isFavorite == null
                  ? SizedBox()
                  : Container(
                      margin: EdgeInsets.only(
                          top: myApplication.hightClc(context, 8),
                          left: myApplication.widthClc(context, 8)),
                      height: myApplication.widthClc(context, 32),
                      width: myApplication.widthClc(context, 32),
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: isFavorite == true
                              ? InkWell(
                                  onTap: () {
                                    RemoveFromFavoriteCubit.get(context)
                                        .userRemoveFromFavorite(
                                            adId!,
                                            CacheHelper.getFromShared("token"),
                                            context);
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    if (CacheHelper.getFromShared("token") ==
                                        null) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext myContext) {
                                          return SorryPopUp();
                                        },
                                      );
                                    } else {
                                      //add fav
                                      AddToFavoriteCubit.get(context)
                                          .userAddToFavorite(
                                              adId!,
                                              CacheHelper.getFromShared(
                                                  "token"),
                                              context);
                                    }
                                  },
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: Colors.red,
                                  ),
                                )),
                    )
              // : Container()
            ],
          ),
          Container(
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
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    title!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                            child: SvgPicture.asset("assets/AdsPics/area.svg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: myApplication.widthClc(context, 125),
                                bottom: myApplication.hightClc(context, 8)),
                            child: Text(
                              "$area m",
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
                            child: Text(
                              "$floors floors",
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
                            child: Text(
                              statee!,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
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
                            child: Text(
                              DateFormat.yMMMd().format(createdAt!).toString(),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "$price SD",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Tajawal",
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "($priceDollar \$)",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Tajawal",
                          color: Colors.black),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () async {
                          await Share.share("sharedtext");
                        },
                        icon: Icon(
                          Icons.share,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 20,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
