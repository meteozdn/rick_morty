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

  @override
  Future<List<Character>?> fetchCharacters() async {
    try {
      final response = await _dio.get(_ServicesPaths.character.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        //    print(_datas.map.runtimeType);
        if (datas["results"] is List) {
          //    print(_datas["results"].map());
          //   return _datas["results"].map((e) => Character.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      //  _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _ServicesPaths { character, location, episode }
