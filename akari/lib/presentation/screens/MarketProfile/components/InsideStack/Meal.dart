import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Meal extends StatelessWidget {
  final String? name;
  final String? pic;
  const Meal({this.name, this.pic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: EdgeInsets.only(bottom: MyApplication.hightClc(context, 16)),
      height: MyApplication.hightClc(context, 138),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(1),
          elevation: 0,
          backgroundColor:
              const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
        ),
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(
              height: 106,
              width: 106,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  (burgeer),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chicken Meal",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Half Chicken, rice , vegetables",
                      style:
                          TextStyle(color: Color(0xFF363537).withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              // color: const Color(0xFFEDEDF4),
                              borderRadius: BorderRadius.circular(5)),
                          height: MyApplication.hightClc(context, 21),
                          width: MyApplication.widthClc(context, 21),
                          child: Center(child: SvgPicture.asset(calories)),
                        ),
                        SizedBox(width: MyApplication.widthClc(context, 8)),
                        Text(
                          "30 calroies",
                          style: TextStyle(
                              color: Color(0xFF363537).withOpacity(0.5)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "87.00 R.S",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: const Color(0xFFEDEDF4),
                      borderRadius: BorderRadius.circular(10)),
                  height: 24,
                  width: 24,
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFEDEDF4),
                      borderRadius: BorderRadius.circular(10)),
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
