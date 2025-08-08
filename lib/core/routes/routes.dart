import 'package:flutter/material.dart';
import 'package:pickle_rick/core/routes/route_names.dart';
import 'package:pickle_rick/presentation/character_detail/view/character_detail_page.dart';
import 'package:pickle_rick/presentation/characteres/view/characteres_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> get routes => {
        RouteNames.home: (_) => const CharacteresPage(),
        RouteNames.characterDetails: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map;
          return CharacterDetailPage(
            character: args['character'],
          );
        },
      };
}
