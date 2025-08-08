import 'package:flutter/material.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';
import 'package:pickle_rick/core/network/api/models/paginated_model.dart';
import 'package:pickle_rick/domain/characteres/usecases/get_characteres_usecase.dart';

class CharacteresListProvider extends ChangeNotifier {
  final GetCharactersUseCase _getCharactersUseCase;

  CharacteresListProvider(this._getCharactersUseCase);

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  PaginatedModel<Character>? _characters;
  PaginatedModel<Character>? get characters => _characters;

  Future<void> fetchPage(int page) async {
    _errorMessage = null;

    final result = await _getCharactersUseCase.call(page: page);

    result.processResult(
      onSuccess: (data) {
        _characters = data;
        notifyListeners();
      },
      onFailure: (error) {
        _errorMessage = error.toString();
        notifyListeners();
      },
    );
  }
}
