import 'dart:io';

import 'package:dio/dio.dart';

import 'character_model.dart';

abstract class ICharacterService {
  Future<List<Character>?> fetchCharacters();
}

class CharacterService implements ICharacterService {
  final Dio _dio;
  CharacterService()
      : _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));
  List<Character> _character = [];
  @override
  Future<List<Character>?> fetchCharacters() async {
    try {
      final response = await _dio.get(_ServicesPaths.character.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas["results"] is List) {
          _character = (datas["results"] as List)
              .map((e) => Character.fromJson(e))
              .toList();
          return _character;
        }
      }
      // ignore: deprecated_member_use
    } on DioError {
      //  _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _ServicesPaths { character, location, episode }
