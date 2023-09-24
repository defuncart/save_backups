# game_saves_backup

An application to backup game saves.

## About

- A cross-platform application which can backup multiple game saves files
- Built for use on the steam deck (Game and Desktop mode)
- Compatible with Lutris, Heroic, Steam, Emulation etc.
- Individual game backup folder names can be customized
- Target Backup folder can be selected (defaults to `/home/deck/Downloads`)
- Minimal, easy to use interface

| | | |
| - | - | - |
| ![](docs/screenshot1.png) | ![](docs/screenshot2.png) | ![](docs/screenshot3.png) |

Not sure where game save files are located? Take a look at the [PC Gaming Wiki](https://www.pcgamingwiki.com/).

Looking for more functionality? Check out [ludusavi](https://github.com/mtkennerly/ludusavi).

## Releases

Check out [release](https://github.com/defuncart/game_saves_backup/releases) for the latest release.

If you wish to build from source, you will require:

- Flutter >= 3.13
- Dart >= 3.1
- macOS:
    - Xcode
    - CocoaPods
- linux:
    - clang
    - ninja-build
    - libgtk-3-dev
    - libblkid-dev

The application has not been tested on windows, however it *should™* theoretically work.

## Motivation

I've encountered some issues in which saves for a particular game via emulation are corrupted, or when upgrading proton version for a Heroic prefix, the save data is lost. The goal of this project is to provide a easy way to backup your most important game saves easily. As this is a personal project, currently there is no roadmap, however new features may be developed when deemed required.

## Known Issues

- On Steam Deck Desktop Mode, 'open' game save folder does not work
- On Steam Deck Desktop Mode, back up folder opens to `/home/deck`, even though real path is saved (i.e. `/home/deck/desktop`).

## Raising Issues and Contributing

Please report bugs and issues [here](https://github.com/defuncart/game_saves_backup/issues).

To contribute, submit a PR with a detailed description and tests, if applicable.
