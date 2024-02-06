import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cycle_10/configration/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  List<String> languagesList = [
    "English",
    "عربي",
  ];

  List<String> themesList = [
    "Dark",
    "Light",
  ];

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    var vm = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            local.language,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            items: languagesList,
            decoration: CustomDropdownDecoration(
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: vm.isDark() ? const Color(0xFFFACC1D) : Colors.black,
              ),
              closedFillColor:
                  vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: vm.isDark() ? const Color(0xFFFACC1D) : Colors.black,
              ),
              expandedFillColor:
                  vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
            ),
            initialItem: vm.currentLanguage == "en" ? "English" : "عربي",
            onChanged: (value) {
              if (value == "English") {
                vm.changeLanguage("en");
              } else if (value == "عربي") {
                vm.changeLanguage("ar");
              }
              print(value);
            },
          ),
          const SizedBox(height: 35),
          Text(
            local.theme,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          CustomDropdown(
            items: themesList,
            initialItem: vm.isDark() ? "Dark" : "Light",
            decoration: CustomDropdownDecoration(
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: vm.isDark() ? const Color(0xFFFACC1D) : Colors.black,
              ),
              closedFillColor:
                  vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: vm.isDark() ? const Color(0xFFFACC1D) : Colors.black,
              ),
              expandedFillColor:
                  vm.isDark() ? const Color(0xFF141A2E) : Colors.white,
            ),
            onChanged: (value) {
              if (value == "Dark") {
                vm.changeTheme(ThemeMode.dark);
              } else if (value == "Light") {
                vm.changeTheme(ThemeMode.light);
              }
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
