#!/usr/bin/env bash

# generate from csv
dart run arb_generator

# generate localization delegates
flutter gen-l10n
