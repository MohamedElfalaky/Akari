// import 'package:client_app/data/cubits/CartItemsCubit/CartItemsCubit.dart';
// import 'package:client_app/data/cubits/TotalFeeCubit/TotalFeeCubit.dart';
// import 'package:client_app/helpers/myApplication.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';

// class CartController {
//   ///vars

//   ///methods
//   void cartAPIs(BuildContext context, String token) async {
//     final bool result = await MyApplication.checkInternet();
//     if (!result) {
//       MyApplication.showToast(
//           text: "No Internet connection | لا يوجد اتصال",
//           color: ToastColors.error);
//     } else {
//       CartItemsCubit.get(context).getCartItems(token);
//       TotalFeeCubit.get(context).getTotalFee(token);
//     }
//   }

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//   Widget notRendertPlusMinus(BuildContext context, IconData icons) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.primary,
//           borderRadius: BorderRadius.circular(10)),
//       height: 30,
//       width: 30,
//       child: Center(
//         child: ElevatedButton(
//           style:
//               ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
//           onPressed: () {},
//           child: Icon(
//             icons,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
