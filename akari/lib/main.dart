import 'package:akari/business_logic/cubits/Local/local_cubit.dart';
import 'package:akari/data/Shared/AppLocalizations.dart';
import 'package:akari/data/Shared/CacheHelper.dart';
import 'package:akari/presentation/screens/AfterFilterAndSearch.dart';
import 'package:akari/presentation/screens/AllCategory.dart';
import 'package:akari/presentation/screens/AppMain.dart';
import 'package:akari/presentation/screens/Filter.dart';
import 'package:akari/presentation/screens/ForgetPassword.dart';
import 'package:akari/presentation/screens/LogIn.dart';
import 'package:akari/presentation/screens/OTP.dart';
import 'package:akari/presentation/screens/OnBoarding.dart';
import 'package:akari/presentation/screens/Register.dart';
import 'package:akari/presentation/screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
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

              locale:
                  state is ChangeLocaleState ? state.local : const Locale('en'),
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

              // لو لغة الهاتف مدعومه ف الاب بتاعي حطها لو لا حط اول لغه
              // localeResolutionCallback: ((deviceLocale, supportedLocales) {
              //   for (var local in supportedLocales) {
              //     if (deviceLocale != null &&
              //         deviceLocale.languageCode == local.languageCode) {
              //       return deviceLocale;
              //     }
              //     return supportedLocales.first;
              //   }
              // }),
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
                // '/afterfilter': (context) => AfterFilterAndSearch(null),
                '/allcategory': (context) => AllCategory(),
                '/register': (context) => Register(),
                '/login': (context) => LogIn(),
                '/forgetpassword': (context) => ForgetPassword(),
                '/otp': (context) => OTP(),
              },
              home: Splash(),
            );
          });
        },
      ),
    );
  }
}
