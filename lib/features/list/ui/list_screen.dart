import 'package:flutter/material.dart';
import 'package:game_saves_backup/core/l10n/l10n_extension.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.listScreenTitle),
      ),
      body: Center(
        child: Text(context.l10n.listScreenNoBackupItems),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
