import 'package:flutter/material.dart';
import 'package:rick_morty/constants/paddings.dart';

import '../services/character_model.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: RnMPaddings.mainPadding,
            child: Column(
              children: [
                Container(
                  child: Image.network(character.image!),
                )
              ],
            ),
          ),
        ));
  }
}
