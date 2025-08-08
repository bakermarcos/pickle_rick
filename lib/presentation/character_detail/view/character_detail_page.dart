import 'package:flutter/material.dart';
import 'package:pickle_rick/core/widgets/status_widget.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                character.imageUrl,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            StatusWidget(status: character.status),
            const SizedBox(height: 16),
            _InfoRow(label: 'Species', value: character.species),
            if (character.type.isNotEmpty)
              _InfoRow(label: 'Type', value: character.type),
            _InfoRow(label: 'Gender', value: character.gender.value),
            _InfoRow(label: 'Origin', value: character.originName.name),
            _InfoRow(label: 'Location', value: character.locationName.name),
            _EpisodeSection(episodes: character.episodes),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}

class _EpisodeSection extends StatelessWidget {
  final List<String> episodes;
  const _EpisodeSection({required this.episodes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          'Episodes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            final episodeUrl = episodes[index];
            final episodeNumber = episodeUrl.split('/').last;
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Episode $episodeNumber'),
            );
          },
        ),
      ],
    );
  }
}
