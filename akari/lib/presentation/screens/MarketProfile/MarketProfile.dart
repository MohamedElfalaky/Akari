// import 'package:badges/badges.dart';

// import 'package:client_app/helpers/LocationService.dart';
// import 'package:client_app/helpers/myApplication.dart';
// import 'package:client_app/presentation/screens/Home/components/HomeScreen.dart';
// import 'package:client_app/presentation/screens/Home/components/MyFloating.dart';
// import 'package:client_app/presentation/screens/Home/components/HomeAppBar.dart';
// import 'package:client_app/presentation/screens/MarketProfile/components/MarketProfileAppBar.dart';
// import 'package:client_app/presentation/screens/MarketProfile/components/MarketProfileScreen.dart';

// import 'package:client_app/presentation/screens/MarketProfile/controller/MarketProfileController.dart';
// import 'package:client_app/style/icons.dart';
// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// import '../../../app/global.dart';

// class MarketProfile extends StatefulWidget {
//   final int id;
//   const MarketProfile(this.id);

//   @override
//   State<MarketProfile> createState() => _MarketProfileState();
// }

// class _MarketProfileState extends State<MarketProfile> {
//   final MarketProfileController _marketProfileControllerController =
//       MarketProfileController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);
//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       }, // hide keyboard on tap anywhere

//       child: Scaffold(
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             centerTitle: true,
//             backgroundColor: Theme.of(context).colorScheme.secondary,
//             toolbarHeight: MyApplication.hightClc(context, 90),
//             elevation: 0,
//             title: MarketProfileAppBar(),
//           ),
//           body: MarketProfileScreen(widget.id)),
//     );
//   }
// }
