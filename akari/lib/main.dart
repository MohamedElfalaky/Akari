import 'package:akari/data/cubits/AllAdds/AllAddsCubit.dart';
import 'package:akari/data/cubits/ForgetPass/ForgetPassCubit.dart';
import 'package:akari/data/cubits/GetFavorites/GetFavoritesCubit.dart';
import 'package:akari/data/cubits/GetMassages/GetMassagesCubit.dart';
import 'package:akari/data/cubits/GetRooms/GetRoomsCubit.dart';
import 'package:akari/data/cubits/Registration/RegistrationCubit.dart';
import 'package:akari/data/cubits/ResendOtp/ResendOtpCubit.dart';
import 'package:akari/data/cubits/ResetPass/ResetPassCubit.dart';
import 'package:akari/data/cubits/VarifyOtp/VarifyOtpCubit.dart';
import 'package:akari/helpers/AppLocalizations.dart';
import 'package:akari/helpers/CacheHelper.dart';
import 'package:akari/helpers/dio_helper.dart';
import 'package:akari/data/cubits/Local/local_cubit.dart';
import 'package:akari/data/cubits/Login_cubit/login_cubit.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page1/FormPage1.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page2/FormPage2.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/Page3/FormPage3.dart';

import 'package:akari/presentation/screens/AdvertisrForm/components/page4/FormPage4.dart';
import 'package:akari/presentation/screens/AdvertisrForm/components/page5/FormPage5.dart';
import 'package:akari/presentation/screens/AllCategory.dart';
import 'package:akari/presentation/screens/AppMain/AppMain.dart';
import 'package:akari/presentation/screens/Filter.dart';
import 'package:akari/presentation/screens/ForgetPassword.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/screens/More/More.dart';
import 'package:akari/presentation/screens/OnBoarding.dart';
import 'package:akari/presentation/screens/Register.dart';
import 'package:akari/presentation/screens/ResetPass.dart';
import 'package:akari/presentation/screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  // CacheHelper.removeFromShared("token");
  // CacheHelper.saveToShared("token", "ddd"); // بخليه غير مسموح له بالدخول
  // print(
  //     DateFormat().formatDuration(DateTime.now().subtract(Duration(hours: 5)))); // المفروض فرق الزمن
  // print(DateFormat.yMMMd().format(DateTime.parse("2022-11-04T06:46:13.081Z")).toString());
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 0));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalCubit()..getSavedLanguage()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<RegistrationCubit>(
            create: (context) => RegistrationCubit()),
        BlocProvider<ResendOtpCubit>(create: (context) => ResendOtpCubit()),
        BlocProvider<VarifyOtpCubit>(create: (context) => VarifyOtpCubit()),
        BlocProvider<ForgetPassCubit>(create: (context) => ForgetPassCubit()),
        BlocProvider<ResetPassCubit>(create: (context) => ResetPassCubit()),
        BlocProvider<GetRoomsCubit>(create: (context) => GetRoomsCubit()),
        BlocProvider<GetMassagesCubit>(create: (context) => GetMassagesCubit()),
        BlocProvider<AllAddsCubit>(create: (context) => AllAddsCubit()),
        BlocProvider<GetFavoritesCubit>(
            create: (context) => GetFavoritesCubit()),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
                builder: (context, child) => ResponsiveWrapper.builder(
                    BouncingScrollWrapper.builder(context, child!),
                    maxWidth: 1200,
                    minWidth: 450,
                    defaultScale: true,
                    breakpoints: [
                      const ResponsiveBreakpoint.resize(450, name: MOBILE),
                      const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                      const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                      const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                    ],
                    background: Container(color: const Color(0xFFF5F5F5))),
                debugShowCheckedModeBanner: false,
                locale: state is ChangeLocaleState
                    ? state.local
                    : const Locale('en'),
                // const Locale('ar'),
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar')
                ], //Localization
                localizationsDelegates: const [
                  AppLocalizations
                      .delegate, // Localization basedon mobile defaulte language
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                title: 'Flutter Demo',
                theme: ThemeData(
                  primaryColor: Color(0xFFDC8035),
                  colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Color(0xFFDC8035),
                      secondary: Color(0xFF116A92),
                      tertiary: Color(0xFFF4F4F4)),
                  scaffoldBackgroundColor: Color(0xFFF4F4F4),
                  // primarySwatch: Colors.blue,
                ),
                routes: {
                  '/splash': (context) => Splash(),
                  '/onboarding': (context) => OnBoarding(),
                  '/appmain': (context) => AppMain(),
                  '/filter': (context) => Filter(),
                  '/allcategory': (context) => AllCategory(),
                  '/register': (context) => Register(),
                  '/login': (context) => LogIn(),
                  '/forgetpassword': (context) => ForgetPassword(),
                },
                home: FormPage5());
          });
        },
      ),
    );
  }
}
