import 'package:flutter/material.dart';
import 'package:game_saves_backup/core/l10n/l10n_extension.dart';
import 'package:game_saves_backup/features/list/ui/list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.l10n.homeScreenNoBackupItems),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.settings),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ListScreen(),
          ),
        ),
      ),
    );
  }
}
