import 'package:flutter/material.dart';
import 'package:pickle_rick/domain/characteres/models/character_status_enum.dart';

class StatusWidget extends StatelessWidget {
  final CharacterStatusEnum status;
  const StatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: CharacterStatusEnum.getStatusColor(status),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        status.value,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
