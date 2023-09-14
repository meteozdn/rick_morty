import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/constants/paddings.dart';

import '../services/character_model.dart';
import '../services/services_get.dart';
import '../themes/colors.dart';
import 'character_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Character>? _characters = [];
  late final ICharacterService _postService = CharacterService();

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _charactersSet();
  }

  Future<void> _charactersSet() async {
    _changeLoading();
    _characters = await _postService.fetchCharacters();
    _changeLoading();
    setState(() {});
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: RnMPaddings.mainPadding,
      child: Column(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearch(characters: _characters!));
              },
              icon: const Icon(Icons.search),
            ),
          ),
          Expanded(
            flex: 10,
            child: (_isLoading == false || _characters == null)
                ? const CircularProgressIndicator.adaptive()
                : Padding(
                    padding: RnMPaddings.mainTopPadding,
                    child: GridView.builder(
                        itemCount: _characters!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CharacterDetails(
                                            character: _characters![index],
                                          )),
                                );
                              },
                              child: Image.network(
                                _characters![index].image!,
                              ),
                            ),
                          );
                        }),
                  ),
          )
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  final List<Character> characters;

  CustomSearch({
    required this.characters,
  });

  List<String> allData = [];

  getData() {
    for (var character in characters) {
      allData.add(character.name!);
    }
    allData = allData.toSet().toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    getData();
    return [
      IconButton(
          onPressed: () {
            query:
            "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // getData();
    List<Character> matchQuery = [];
    for (var item in characters) {
      if (item.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CharacterDetails(
                          character: matchQuery[index],
                        )),
              );
            },
            leading: Image.network(matchQuery[index].image!),
            title: Text(matchQuery[index].name!),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
//    getData();
    List<Character> matchQuery = [];
    for (var item in characters) {
      if (item.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CharacterDetails(
                          character: matchQuery[index],
                        )),
              );
            },
            leading:
                CircleAvatar(child: Image.network(matchQuery[index].image!)),
            title: Text(matchQuery[index].name!),
          );
        });
  }
}
