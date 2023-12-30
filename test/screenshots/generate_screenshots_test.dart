import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:game_saves_backup/core/sync/models/sync_progress.dart';
import 'package:game_saves_backup/core/sync/state/backup_items_state.dart';
import 'package:game_saves_backup/core/sync/state/sync_items_state.dart';
import 'package:game_saves_backup/core/theme/themes.dart';
import 'package:game_saves_backup/features/home/ui/home_screen.dart';
import 'package:game_saves_backup/features/list/ui/list_screen.dart';

void main() {
  const textStyle = TextStyle(
    fontSize: 96,
    color: Colors.white,
  );

  generateAppStoreScreenshots(
    config: ScreenshotsConfig(
      devices: [DeviceType.linux],
      locales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      background: ScreenshotBackground.solid(
        color: lightTheme.colorScheme.primary,
      ),
      theme: darkTheme,
      textStyle: textStyle,
    ),
    screens: [
      ScreenshotScenario(
        onBuildScreen: () => const ListScreen(),
        wrapper: (child) => ProviderScope(
          overrides: [
            syncDirectoryControllerProvider.overrideWith(() => FakeSyncDirectoryController()),
            syncCreateNewFoldersControllerProvider.overrideWith(() => FakeSyncCreateNewFoldersController()),
            backupItemsProvider.overrideWith(() => FakeBackupItems()),
          ],
          child: child,
        ),
        text: ScreenshotText(
          text: {
            const Locale('en'): 'Light mode',
          },
        ),
      ),
      ScreenshotScenario(
        onBuildScreen: () => const SizedBox(
          width: 540,
          child: HomeScreen(),
        ),
        wrapper: (child) => ProviderScope(
          overrides: [
            hasBackupItemsProvider.overrideWithValue(true),
            syncStatusControllerProvider.overrideWith(
              () => FakeSyncStatusController(
                state: const SyncStatusReady(),
              ),
            ),
          ],
          child: child,
        ),
        text: ScreenshotText(
          text: {
            const Locale('en'): 'Light mode',
          },
        ),
      ),
      ScreenshotScenario(
        onBuildScreen: () => const SizedBox(
          width: 540,
          child: HomeScreen(),
        ),
        wrapper: (child) => ProviderScope(
          overrides: [
            hasBackupItemsProvider.overrideWithValue(true),
            syncStatusControllerProvider.overrideWith(
              () => FakeSyncStatusController(
                state: const SyncStatusCompleted(itemsSynced: 2),
              ),
            ),
          ],
          child: child,
        ),
        text: ScreenshotText(
          text: {
            const Locale('en'): 'Light mode',
          },
        ),
      ),
    ],
  );
}

class FakeSyncStatusController extends AutoDisposeNotifier<SyncStatus> implements SyncStatusController {
  FakeSyncStatusController({
    required SyncStatus state,
  }) : _state = state;

  final SyncStatus _state;

  @override
  SyncStatus build() => _state;

  @override
  Future<void> sync() async {}

  @override
  void reset() {}
}

class FakeSyncDirectoryController extends AutoDisposeAsyncNotifier<String> implements SyncDirectoryController {
  FakeSyncDirectoryController();

  @override
  Future<String> build() async => '';

  @override
  Future<void> setPath(String path) async {}
}

class FakeSyncCreateNewFoldersController extends AutoDisposeNotifier<bool> implements SyncCreateNewFoldersController {
  @override
  bool build() => true;

  @override
  void toggle() {}
}

class FakeBackupItems extends AutoDisposeNotifier<List<BackupItem>> implements BackupItems {
  @override
  List<BackupItem> build() => const [
        BackupItem(
          id: '1',
          path:
              '/run/media/mmcblk0p1/Games/Heroic/Prefixes/HorizonChaseTurbo/drive_c/users/deck/AppData/LocalLow/Aquiris/HorizonChaseTurbo/HorizonChaseTurbo_EpicGameStore/0',
          folderName: 'HorizonChaseTurbo',
        ),
        BackupItem(
          id: '2',
          path: '/run/media/mmcblk0p1/Games/deus-ex/drive_c/GOG Games/DeusEx/Save',
          folderName: 'deus-ex',
        ),
      ];

  @override
  void add({required String path}) {}

  @override
  void updateName({
    required BackupItem item,
    required String folderName,
  }) {}

  @override
  void remove(String id) {}
}
