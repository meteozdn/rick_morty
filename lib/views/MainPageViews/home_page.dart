import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/constants/paddings.dart';
import 'package:rick_morty/services/services_get.dart';
import 'package:rick_morty/themes/colors.dart';

import '../../services/character_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _unkown = "UNKOWN";
  List<Character>? _characters = [];

  late final ICharacterService _postService = CharacterService();

  @override
  void initState() {
    super.initState();
    //   _postService = CharacterService();
    _charactersSet();
  }

  Future<void> _charactersSet() async {
    _characters = await _postService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: randomCardWidget(screenWidth),
          ),
          Expanded(
            flex: 5,
            child: Container(
              //   color: Colors.blue,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.network(_characters![index].image!),
                    ),
                  );
                },
                itemCount: 5, // Can be null
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding randomCardWidget(double screenWidth) {
    return Padding(
      padding: RnMPaddings.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODOdüzelecek
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: CategoryWidget(
              title: "RANDOM CARD",
            ),
          ),
          SizedBox(
            height: screenWidth / 4,
            child: Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: screenWidth / 4,
                    width: screenWidth / 4,
                    child: Image.network(_characters![0].image!)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: randomCardNameText(
                                  _characters![0].name ?? _unkown),
                            )),
                          ],
                        ),
                        StatusWidget(
                          status: _characters![0].status ?? _unkown,
                        ),
                        randomCardPropertyText(
                            _characters![0].gender ?? _unkown),
                        randomCardPropertyText(
                            _characters![0].species ?? _unkown),
                        randomCardPropertyText(_characters![0].type == ""
                            ? _unkown
                            : _characters![0].type!),
                        randomCardPropertyText((_characters![0].origin != null)
                            ? (_characters![0].origin!.name ?? _unkown)
                            : _unkown),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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

  Text randomCardNameText(String text) {
    return Text(
      text,
      maxLines: 1,
      style: const TextStyle(
          overflow: TextOverflow.fade,
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.status,
  });
  final String status;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: status == "Alive" ? Colors.green : Colors.red,
          radius: 5,
        ),
        Text(
          status,
          style: const TextStyle(
            fontSize: 18,
            //color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
