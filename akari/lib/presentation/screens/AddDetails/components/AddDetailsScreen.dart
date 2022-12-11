import 'package:akari/helpers/myApplication.dart';
import 'package:akari/presentation/screens/AddDetails/components/SorryPopUp.dart';
import 'package:akari/presentation/widgets/Shared/Button.dart';
import 'package:akari/style/Icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(
              // top: 8,
              bottom: 17),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: 800,
          // width: myApplication.widthClc(context, 327),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                // alignment: AlignmentDirectional.topEnd,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 8),
                        height: 32,
                        width: 32,
                        child: Center(
                            child: BackButton(
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, right: 8),
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                        )),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 12),
                    vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: myApplication.hightClc(context, 12)),
                          child: AutoSizeText(
                            "Villa five stars",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
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
                                  margin: EdgeInsets.only(right: 6, bottom: 8),
                                  height: 14,
                                  width: 14,
                                  child: SvgPicture.asset(
                                      "assets/AdsPics/location.svg")),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        myApplication.hightClc(context, 12)),
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
                                    right: 6,
                                  ),
                                  height: 14,
                                  width: 14,
                                  child: SvgPicture.asset(
                                      "assets/AdsPics/post date.svg")),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        myApplication.hightClc(context, 12)),
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
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 12),
                    vertical: 8),
                // height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description", style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 12),
                    vertical: 8),
                // height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rooms and Beds",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    SizedBox(
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
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child:
                                    SvgPicture.asset("assets/AdsPics/area.svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
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
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child: SvgPicture.asset(
                                    "assets/AdsPics/floor no..svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AutoSizeText(
                                  "3 floors",
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
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child: SvgPicture.asset(
                                  roomm,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
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
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child: SvgPicture.asset(bedd),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
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
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child: SvgPicture.asset(bedd),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AutoSizeText(
                                  "3 Bathrooms",
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
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 12),
                    vertical: 8),
                // height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ways of comfort",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    SizedBox(
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
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child:
                                    SvgPicture.asset("assets/AdsPics/area.svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AutoSizeText(
                                  "elevator",
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
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child: SvgPicture.asset(
                                    "assets/AdsPics/floor no..svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AutoSizeText(
                                  "Wifi",
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
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child: SvgPicture.asset(
                                  roomm,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AutoSizeText(
                                  "TV",
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
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 6, bottom: 8),
                                height: 14,
                                width: 14,
                                child: SvgPicture.asset(bedd),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AutoSizeText(
                                  "kitchen",
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
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: myApplication.widthClc(context, 12),
                    vertical: 8),
                // height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price", style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "150 SD/month",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    myButton(() {}, "Contact Advertiser"),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
