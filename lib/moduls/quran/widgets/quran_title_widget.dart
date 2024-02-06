import 'package:cycle_10/moduls/quran/page/quran_details_view.dart';
import 'package:flutter/material.dart';

class QuranTitleWidget extends StatelessWidget {
  final String suraName;
  final int suraIndex;

  const QuranTitleWidget({
    super.key,
    required this.suraName,
    required this.suraIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          QuranDetailsView.routeName,
          arguments: SuraDetailsData(
            suraName,
            suraIndex.toString(),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              suraIndex.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "El Messiri",
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            width: 1,
            height: 50,
            child: VerticalDivider(),
          ),
          Expanded(
            child: Text(
              suraName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "El Messiri",
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuraDetailsData {
  final String suraName;
  final String suraNumber;

  SuraDetailsData(
    this.suraName,
    this.suraNumber,
  );
}
