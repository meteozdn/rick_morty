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
          title: Text(character.name!.split(" ")[0]),
          centerTitle: false,
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
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: RnMPaddings.mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: SizedBox(
                            //height: 500,
                            width: 500,
                            child: Image.network(
                              character.image!,
                              fit: BoxFit.fill,
                            ),
                          )),
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
                  Padding(
                    padding: RnMPaddings.mainTopPadding,
                    child: allStatusMethod(),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Column allStatusMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharacterPropertiesText(
          isStatus: true,
          state: character.status!,
          property: "Status",
        ),
        CharacterPropertiesText(
          state: character.species!,
          property: "Species",
        ),
        CharacterPropertiesText(
          state: character.type!,
          property: "Type",
        ),
        CharacterPropertiesText(
          state: character.gender!,
          property: "Gender",
        ),
        CharacterPropertiesText(
          state: character.origin!.name!,
          property: "Origin",
        ),
        CharacterPropertiesText(
          state: character.location!.name!,
          property: "Location",
        ),
      ],
    );
  }
}

class CharacterPropertiesText extends StatelessWidget {
  CharacterPropertiesText({
    this.isStatus = false,
    super.key,
    required this.state,
    required this.property,
  });
  bool isStatus;
  final String state;
  final String property;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$property: ",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        isStatus
            ? CircleAvatar(
                radius: 6,
                backgroundColor: state == "Alive" ? Colors.green : Colors.red,
              )
            : const Text(""),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              state,
              //  maxLines: 2,
              // overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
