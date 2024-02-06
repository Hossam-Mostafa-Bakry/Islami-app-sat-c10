import 'dart:async';

import 'package:cycle_10/configration/settings_provider.dart';
import 'package:cycle_10/layout/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, LayoutView.routeName);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Image.asset(
        vm.isDark()
            ? "assets/images/splash_dark_background.png"
            : "assets/images/splash_screen.png",
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
