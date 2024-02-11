import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:game_saves_backup/core/extensions/theme_extensions.dart';
import 'package:game_saves_backup/core/theme/themes.dart';

void main() {
  generateStreamIcon(
    onBuildIcon: (size) => Theme(
      data: darkTheme,
      child: SteamAsset(
        size: size,
      ),
    ),
  );

  generateStreamCover(
    onBuildCover: (size) => Theme(
      data: darkTheme,
      child: SteamAsset(
        size: size,
      ),
    ),
  );

  generateStreamBackground(
    onBuildBackground: (size) => Theme(
      data: darkTheme,
      child: SteamAsset(
        size: size,
      ),
    ),
  );
}

class SteamAsset extends StatelessWidget {
  const SteamAsset({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.backup,
              color: context.colorScheme.primary,
              size: size.shortestSide * 0.6,
            ),
            if (size.shortestSide > 600) ...[
              const SizedBox(width: 128),
              Text(
                'Game\nSaves\nBackup',
                style: TextStyle(
                  fontSize: size.shortestSide * 0.6 * 0.1825,
                  color: context.colorScheme.primary.withOpacity(0.6),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
