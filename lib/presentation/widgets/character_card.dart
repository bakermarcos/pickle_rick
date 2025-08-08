import 'package:flutter/material.dart';
import 'package:pickle_rick/core/routes/route_names.dart';
import 'package:pickle_rick/core/widgets/status_widget.dart';
import 'package:pickle_rick/domain/characteres/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          RouteNames.characterDetails,
          arguments: {'character': character},
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                color: Colors.grey,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  character.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    StatusWidget(status: character.status),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
