import 'package:cycle_10/moduls/hadeth/page/hadeth_view.dart';
import 'package:flutter/material.dart';

class HadethDetailsView extends StatelessWidget {
  static const String routeName = "HadethDetails";

  const HadethDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)?.settings.arguments as HadethContentData;

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
            bottom: 40.0,
          ),
          decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8).withOpacity(0.8),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                args.hadethTitle,
                style: const TextStyle(
                    fontFamily: "El Messiri",
                    fontSize: 25,
                    fontWeight: FontWeight.normal),
              ),
              const Divider(
                endIndent: 40,
                indent: 40,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      args.hadethContent,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
