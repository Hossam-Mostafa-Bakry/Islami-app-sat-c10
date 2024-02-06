import 'package:cycle_10/configration/settings_provider.dart';
import 'package:cycle_10/moduls/quran/widgets/quran_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "QuranDetails";

  QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsData;
    var vm = Provider.of<SettingsProvider>(context);
    // async
    if (versesList.isEmpty) loadData(args.suraNumber);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(vm.getMainBackground()),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: Container(
          height: mediaQuery.height,
          width: mediaQuery.width,
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 15.0,
            bottom: 80.0,
          ),
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 15.0,
            bottom: 80.0,
          ),
          decoration: BoxDecoration(
              color: vm.isDark()
                  ? const Color(0xFF141A2E).withOpacity(0.8)
                  : const Color(0xFFF8F8F8).withOpacity(0.8),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " سورة ${args.suraName}",
                    style: TextStyle(
                      fontFamily: "El Messiri",
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color:
                          vm.isDark() ? Color(0xFFFACC1D) : Color(0xFF242424),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.play_circle_filled_rounded,
                    size: 28,
                    color: vm.isDark() ? Color(0xFFFACC1D) : Color(0xFF242424),
                  )
                ],
              ),
              const Divider(
                endIndent: 40,
                indent: 40,
              ),
              if (versesList.isEmpty)
                Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                ),
              if (versesList.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      "{${index + 1}} ${versesList[index]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "El Messiri",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color:
                            vm.isDark() ? Color(0xFFFACC1D) : Color(0xFF242424),
                      ),
                    ),
                    itemCount: versesList.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

// Future<String> == String
  List<String> versesList = [];

  Future<void> loadData(String index) async {
    var suraContent = await rootBundle.loadString("assets/files/$index.txt");
    versesList = suraContent.split("\n");
    setState(() {});
  }
}
