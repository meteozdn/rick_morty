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
  List<Character>? _characters = [];

  late final ICharacterService _postService;

  @override
  void initState() {
    super.initState();
    _postService = CharacterService();
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
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

/*
  Future<void> fetchPostItems() async {
    final response = await Dio().get('${_baseUrl}character');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        print(_datas);
        setState(() {
          _characters = _datas.map((e) => Character.fromJson(e)).toList();
        });
      }
    }
  }
*/
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
                    child: const Placeholder()),
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
                              child: randomCardNameText("aasdasdsada"),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 5,
                            ),
                            randomCardPropertyText("Live"),
                          ],
                        ),
                        randomCardPropertyText("species"),
                        randomCardPropertyText("type"),
                        randomCardPropertyText("gender"),
                        randomCardPropertyText("origin"),
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
