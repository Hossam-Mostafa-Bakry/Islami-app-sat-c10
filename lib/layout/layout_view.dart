import 'package:cycle_10/moduls/hadeth/page/hadeth_view.dart';
import 'package:cycle_10/moduls/quran/page/quran_view.dart';
import 'package:cycle_10/moduls/radio/page/radio_view.dart';
import 'package:cycle_10/moduls/settings/page/settings_view.dart';
import 'package:cycle_10/moduls/tasbesh/page/tasbeh_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = "layout";

  LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main_background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.islami),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/quran_icn.png"),
              ),
              label: local.quran,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/hadeth_icn.png"),
              ),
              label: local.hadith,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/sebha_icn.png"),
              ),
              label: local.tasbeh,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/radio_icn.png"),
              ),
              label: local.radio,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: local.settings,
            ),
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }

  List<Widget> screens = [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    SettingsView(),
  ];
}
