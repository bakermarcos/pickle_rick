import 'package:flutter/material.dart';
import 'package:pickle_rick/core/widgets/paginated_list_view.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';
import 'package:pickle_rick/presentation/characteres/provider/characteres_provider.dart';
import 'package:pickle_rick/presentation/widgets/character_card.dart';
import 'package:provider/provider.dart';

class CharacteresPage extends StatefulWidget {
  const CharacteresPage({super.key});

  @override
  State<CharacteresPage> createState() => _CharacteresPageState();
}

class _CharacteresPageState extends State<CharacteresPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharacteresListProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: Column(
        children: [
          if (viewModel.errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          Expanded(
            child: PaginatedListView<Character>(
              fetchPage: (page) async {
                await viewModel.fetchPage(page);
                return viewModel.characters;
              },
              itemBuilder: (context, character, index) =>
                  CharacterCard(character: character),
            ),
          ),
        ],
      ),
    );
  }
}
