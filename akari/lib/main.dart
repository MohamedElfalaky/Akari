import 'package:akari/business_logic/cubits/Local/local_cubit.dart';
import 'package:akari/data/Shared/AppLocalizations.dart';
import 'package:akari/data/Shared/CacheHelper.dart';
import 'package:akari/presentation/screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            locale:
                state is ChangeLocaleState ? state.local : const Locale('en'),
            // const Locale('ar'),
            supportedLocales: const [Locale('en'), Locale('ar')], //Localization
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
              primarySwatch: Colors.blue,
            ),
            routes: {
              // '/': (context) => const LogIn(),
              '/splash': (context) => Splash(),
            },
            home: Splash(),
          );
        },
      ),
    );
  }
}
