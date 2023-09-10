import 'package:flutter/material.dart';
import 'package:rick_morty/constants/paddings.dart';

import '../services/character_model.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: RnMPaddings.mainHorizontalPadding,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.ios_share_outlined)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite)),
                ],
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: RnMPaddings.mainPadding,
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.network(character.image!)),
                Padding(
                  padding: RnMPaddings.mainTopPadding,
                  child: Text(
                    character.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
