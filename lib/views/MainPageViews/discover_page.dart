import 'package:flutter/material.dart';
import 'package:rick_morty/themes/colors.dart';

import '../../services/character_model.dart';
import '../../services/services_get.dart';
import '../character_details_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final String _allCharactersText = "All Characters";
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
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Text(
                _allCharactersText,
                style: const TextStyle(
                    color: RnMColors.paleCornflowerBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        )),
        Expanded(
          flex: 10,
          child: (_isLoading == false || _characters == null)
              ? const CircularProgressIndicator.adaptive()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
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
    );
  }
}
