import 'package:flutter/material.dart';

class OneChat extends StatelessWidget {
  final String? img;
  const OneChat({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(0.5)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(img ??
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                      fit: BoxFit.fill),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Ahmed Mohamed",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "نعم مازال متوفر كيف يمككني مساعدتك ؟نعم مازال متوفر كيف يمككني مساعدتك ؟",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(4),
            // height: 18,
            // width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.timelapse,
                  size: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "20 min",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
