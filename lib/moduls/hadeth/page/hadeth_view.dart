import 'package:cycle_10/moduls/hadeth/page/hadeth_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethView extends StatefulWidget {
  HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    if (allHadethData.isEmpty) loadData();
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_header.png",
          height: mediaQuery.height * 0.2,
        ),
        Divider(
          thickness: 1.2,
          color: theme.primaryColor,
        ),
        const Text(
          "الاحاديث",
          style: TextStyle(
              fontFamily: "El Messiri",
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Divider(
          thickness: 1.2,
          color: theme.primaryColor,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  HadethDetailsView.routeName,
                  arguments: allHadethData[index],
                );
              },
              child: Text(
                allHadethData[index].hadethTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.8,
                ),
              ),
            ),
            itemCount: allHadethData.length,
          ),
        )
      ],
    );
  }

  List<HadethContentData> allHadethData = [];

  Future<void> loadData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> alHadethList = content.split("#");

    for (int i = 0; i < alHadethList.length; i++) {
      String singleHadeth = alHadethList[i].trim();

      int titleLength = singleHadeth.indexOf("\n");

      String title = singleHadeth.substring(0, titleLength);
      String content = singleHadeth.substring(titleLength + 1);

      HadethContentData hadethContentData = HadethContentData(
        title,
        content,
      );

      allHadethData.add(hadethContentData);
    }
    setState(() {});
  }
}

class HadethContentData {
  final String hadethTitle;
  final String hadethContent;

  HadethContentData(this.hadethTitle, this.hadethContent);
}
