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
    return Row(
      children: [
        Expanded(
          child: Text(
            suraIndex.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "El Messiri",
              fontWeight: FontWeight.normal,
              fontSize: 22,
            ),
          ),
        ),
        Container(
          width: 1,
          height: 50,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: Text(
            suraName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "El Messiri",
              fontWeight: FontWeight.normal,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
