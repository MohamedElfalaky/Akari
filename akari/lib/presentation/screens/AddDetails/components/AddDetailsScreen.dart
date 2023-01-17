import 'dart:io';

import 'package:akari/data/cubits/AddToFavorite/AddToFavoriteCubit.dart';
import 'package:akari/data/cubits/GetUserData%20copy/GetUser2Cubit.dart';
import 'package:akari/data/cubits/GetUserData/GetUserDataCubit.dart';
import 'package:akari/data/cubits/IncreaseCall/IncreaseCallCubit.dart';
import 'package:akari/data/cubits/RemoveFromFavorite/RemoveFromFavoriteCubit.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/SorryPopUp.dart';
import 'package:akari/presentation/screens/OneChat/OneChatPage.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../helpers/AppLocalizations.dart';

class AddDetailsScreen extends StatelessWidget {
  final String? contractType;
  final String? buildingType;
  final String? deliveryTerm;
  final String? address;
  final String? createdAt;
  final String? description;
  final String? area;
  final String? floor;
  final String? bedRooms;
  final String? bathRooms;
  final List<dynamic>? amenities;
  final String? priceSd;
  final String? priceDollar;
  final String? phone;
  final String? advertiserId;
  final String? adId;
  final bool? isFavorite;
  const AddDetailsScreen(
      {super.key,
      this.contractType,
      this.buildingType,
      this.deliveryTerm,
      this.address,
      this.createdAt,
      this.description,
      this.area,
      this.floor,
      this.bedRooms,
      this.bathRooms,
      this.amenities,
      this.priceSd,
      this.priceDollar,
      this.phone,
      this.advertiserId,
      this.adId,
      this.isFavorite});
  @override
  Widget build(BuildContext context) {
    void launchWhatsapp(String numberr, String massagee) async {
      String androidUrl = "whatsapp://send?phone=+2$numberr&text=$massagee";
      String iosUrl = "https://wa.me/+2$numberr?text=${Uri.parse(massagee)}";

      if (Platform.isIOS) {
        await canLaunchUrl(Uri.parse(
          iosUrl,
        ))
            ? launchUrl(Uri.parse(iosUrl))
            : myApplication.showToast(
                text: "cannot open whats app".tr(context),
                color: Theme.of(context).colorScheme.primary);
      } else {
        await canLaunchUrl(Uri.parse(
          androidUrl,
        ))
            ? launchUrl(Uri.parse(androidUrl))
            : myApplication.showToast(
                text: "cannot open whats app".tr(context),
                color: Theme.of(context).colorScheme.primary);
      }
    }

    // launchUrl(Uri.parse("tel://+2${widget.phoneNumber}"));

    return Container(
      margin: const EdgeInsets.only(
          // top: 8,
          bottom: 17),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      // height: MediaQuery.of(context).size.height,
      // width: myApplication.widthClc(context, 327),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            // alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      fit: BoxFit.fill),
                  // color: Colors.green,
                ),
                height: myApplication.hightClc(context, 176),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8, left: 8),
                    height: 32,
                    width: 32,
                    child: Center(
                        child: BackButton(
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    )),
                  ),
                  isFavorite == false
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            if (CacheHelper.getFromShared("token") == null) {
                              showDialog(
                                context: context,
                                builder: (BuildContext myContext) {
                                  return SorryPopUp();
                                },
                              );
                            } else {
                              isFavorite == null
                                  ? AddToFavoriteCubit.get(context)
                                      .userAddToFavorite(
                                          adId!,
                                          CacheHelper.getFromShared("token"),
                                          context)
                                  : RemoveFromFavoriteCubit.get(context)
                                      .userRemoveFromFavorite(
                                          adId!,
                                          CacheHelper.getFromShared("token"),
                                          context);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 8, right: 8),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: isFavorite == null
                                    ? const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )),
                          ),
                        ),
                ],
              )
            ],
          ),
          Container(
            decoration: const BoxDecoration(
                // color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: myApplication.widthClc(context, 12), vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: myApplication.hightClc(context, 12)),
                      child: Text(
                        "${buildingType ?? ""}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        await Share.share("sharedtext");
                      },
                      child: Icon(
                        Icons.share,
                        color: Theme.of(context).colorScheme.secondary,
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
                              margin:
                                  const EdgeInsets.only(right: 6, bottom: 8),
                              height: 14,
                              width: 14,
                              child: SvgPicture.asset(
                                  "assets/AdsPics/location.svg")),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: myApplication.hightClc(context, 12)),
                            child: Text(
                              "${'Sudan'.tr(context)}, ${address ?? ""} ",
                              style: const TextStyle(
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
                                right: 6,
                              ),
                              height: 14,
                              width: 14,
                              child: SvgPicture.asset(
                                  "assets/AdsPics/post date.svg")),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: myApplication.hightClc(context, 12)),
                            child: createdAt != null
                                ? Text(
                                    DateFormat.yMMMd()
                                        .format(DateTime.parse(createdAt!))
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                : Text(""),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: myApplication.widthClc(context, 12), vertical: 8),
            // height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description".tr(context),
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(
                  height: 8,
                ),
                Text(description ?? "")
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: myApplication.widthClc(context, 12), vertical: 8),
            // height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rooms and Beds".tr(context),
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 6, bottom: 8),
                            height: 14,
                            width: 14,
                            child: SvgPicture.asset("assets/AdsPics/area.svg"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "${area ?? ""}",
                              style: const TextStyle(
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
                            margin: const EdgeInsets.only(right: 6, bottom: 8),
                            height: 14,
                            width: 14,
                            child: SvgPicture.asset(
                                "assets/AdsPics/floor no..svg"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "${floor ?? ""} ${'floors'.tr(context)}",
                              style: const TextStyle(
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
                            margin: const EdgeInsets.only(right: 6, bottom: 8),
                            height: 14,
                            width: 14,
                            child: SvgPicture.asset(
                              roomm,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "${bathRooms ?? ""} ${'bathRooms'.tr(context)}",
                              style: const TextStyle(
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
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 6, bottom: 8),
                            height: 14,
                            width: 14,
                            child: SvgPicture.asset(bedd),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "${bedRooms ?? ""} ${'bedrooms'.tr(context).tr(context)}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: myApplication.widthClc(context, 12), vertical: 8),
            // height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amenties".tr(context),
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  height: 8,
                ),
                Wrap(children: [
                  ...amenities!.map(
                    (e) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  ).toList()
                ])
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: myApplication.widthClc(context, 12), vertical: 8),
            // height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price".tr(context), style: const TextStyle(fontSize: 16)),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "${priceSd ?? ""} ${'SD'.tr(context)}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "(${{priceDollar ?? ""}} \$)",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                myButton(() {
                  if (CacheHelper.getFromShared("token") == null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext myContext) {
                        return SorryPopUp();
                      },
                    );
                  } else {
                    showModalBottomSheet(
                        barrierColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0),
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(20),
                            height: 330,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                                color: Colors.white,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Price".tr(context),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${priceSd ?? ""} ${'SD'.tr(context)}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "(${priceDollar ?? ""} \$)",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                myButton(
                                  () {
                                    IncreaseCallCubit.get(context)
                                        .userIncreaseCall(
                                            context: context,
                                            advertiserId: advertiserId!,
                                            token: CacheHelper.getFromShared(
                                                "token"),
                                            userId: CacheHelper.getFromShared(
                                                "id"));
                                    launchUrl(Uri.parse("tel://+2${phone}"));
                                  },
                                  "Call".tr(context),
                                  btnClr:
                                      Theme.of(context).colorScheme.secondary,
                                  txtClr: Colors.white,
                                  btnIcon: const Icon(Icons.phone),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                myButton(
                                  () {
                                    // myApplication.navigateTo(
                                    //     OneChatPage(
                                    //       image: ,

                                    //     ), context);
                                  },
                                  "Chat".tr(context),
                                  btnClr: Colors.white,
                                  txtClr:
                                      Theme.of(context).colorScheme.secondary,
                                  btnIcon: Icon(
                                    Icons.chat,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                myButton(
                                  () {
                                    launchWhatsapp(phone!, "hello");
                                  },
                                  "Whats App".tr(context),
                                  btnClr: Colors.white,
                                  txtClr:
                                      Theme.of(context).colorScheme.secondary,
                                  btnIcon: Icon(
                                    Icons.whatsapp,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 130,
                                    child: myButton(
                                      () {
                                        Navigator.pop(context);
                                      },
                                      "Cancel".tr(context),
                                      btnIcon: const Icon(Icons.close),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                }, "Contact Advertiser".tr(context)),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // void goToChatRoom(context) {
  //   GetUser2Cubit.get(context).userGetUser2(
  //       userId: advertiserId!, token: CacheHelper.getFromShared("token"));
  // }
}
