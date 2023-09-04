import 'package:flutter/material.dart';
import 'package:rick_morty/constants/paddings.dart';
import 'package:rick_morty/themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: RnMPaddings.mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODOdüzelecek
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: CategoryWidget(
                    title: "RANDOM CARD",
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: screenWidth / 6, child: const Placeholder()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          randomCardNameText(),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 5,
                              ),
                              randomCardPropertyText("Live-Human-Female"),
                            ],
                          ),
                          Padding(
                            padding: RnMPaddings.mainTopPadding,
                            child: randomCardPropertyText("First Seen:"),
                          ),
                          randomCardPropertyText("Boston"),
                          Padding(
                            padding: RnMPaddings.mainTopPadding,
                            child: randomCardPropertyText("Last Seen:"),
                          ),
                          randomCardPropertyText("Çorum"),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Text randomCardPropertyText(String text, {Color? color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text randomCardNameText() {
    return const Text(
      "CHARACTER NAME",
      style: TextStyle(
          overflow: TextOverflow.fade,
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String title;
  const CategoryWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: RnMColors.paleCornflowerBlue,
        shape: StadiumBorder(),
      ),
      child: Padding(
        padding: RnMPaddings.buttonsPadding,
        child: Text(
          title,
          style: const TextStyle(
              color: RnMColors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
