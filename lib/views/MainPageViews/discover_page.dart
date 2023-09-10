import 'package:flutter/material.dart';

import '../../services/character_model.dart';
import '../../services/services_get.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<Character>? _characters = [];
  late final ICharacterService _postService = CharacterService();

  bool _isLoading = false;
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
        Expanded(child: SizedBox()),
        Expanded(
            flex: 6,
            child: Container(
              color: Colors.red,
              child: _characters == null
                  ? const CircularProgressIndicator.adaptive()
                  : GridView.count(
                      crossAxisCount: 5,
                    ),
            ))
      ],
    );
  }
}
