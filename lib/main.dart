import 'package:cycle_10/configration/application_theme_manager.dart';
import 'package:cycle_10/configration/settings_provider.dart';
import 'package:cycle_10/layout/layout_view.dart';
import 'package:cycle_10/moduls/hadeth/page/hadeth_details_view.dart';
import 'package:cycle_10/moduls/quran/page/quran_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'moduls/splash/page/splash_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'Islami Application',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      themeMode: vm.isDark() ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(vm.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => LayoutView(),
        QuranDetailsView.routeName: (context) => QuranDetailsView(),
        HadethDetailsView.routeName: (context) => HadethDetailsView(),
      },
    );
  }
}
