import 'package:cycle_10/moduls/quran/widgets/quran_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    // async
    if (versesList.isEmpty) loadData(args.suraNumber);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/main_background.png",
        ),
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
              color: const Color(0xFFF8F8F8).withOpacity(0.8),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " سورة ${args.suraName}",
                    style: const TextStyle(
                        fontFamily: "El Messiri",
                        fontSize: 25,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.play_circle_filled_rounded,
                    size: 28,
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
                      style: const TextStyle(
                          fontFamily: "El Messiri",
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
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
