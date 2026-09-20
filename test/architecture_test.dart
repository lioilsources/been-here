import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// `domain/` and `core/` must stay free of Flutter and of every plugin, so the
/// logic they hold runs on the plain Dart VM against fakes.
///
/// The project can't depend on `package:test` directly (flutter_test pins an
/// incompatible `matcher`), so this guard enforces the rule instead of the
/// test runner doing it for us.
const _bannedInPureLayers = <String>[
  'package:flutter/',
  'package:flutter_riverpod/',
  'package:flutter_localizations/',
  'package:drift_flutter/',
  'package:photo_manager/',
  'package:geolocator/',
  'package:camera/',
  'package:native_geofence/',
  'package:flutter_local_notifications/',
  'package:geocoding/',
  'package:permission_handler/',
  'dart:ui',
];

/// Layers that may not reach into the UI.
const _bannedInDataLayer = <String>[
  'package:flutter/material.dart',
  'package:flutter/cupertino.dart',
  'package:flutter/widgets.dart',
  'package:been_here/features/',
];

Iterable<File> _dartFilesIn(String path) sync* {
  final dir = Directory(path);
  if (!dir.existsSync()) return;
  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File &&
        entity.path.endsWith('.dart') &&
        !entity.path.endsWith('.g.dart')) {
      yield entity;
    }
  }
}

List<String> _importsOf(File file) => file
    .readAsLinesSync()
    .where((l) => l.startsWith('import ') || l.startsWith('export '))
    .toList();

void main() {
  group('layering', () {
    test('core/ imports no Flutter and no plugins', () {
      final violations = <String>[];
      for (final file in _dartFilesIn('lib/core')) {
        for (final line in _importsOf(file)) {
          for (final banned in _bannedInPureLayers) {
            if (line.contains(banned)) {
              violations.add('${file.path}: $line');
            }
          }
        }
      }
      expect(violations, isEmpty, reason: violations.join('\n'));
    });

    test('domain/ imports no Flutter and no plugins', () {
      final violations = <String>[];
      for (final file in _dartFilesIn('lib/domain')) {
        for (final line in _importsOf(file)) {
          for (final banned in _bannedInPureLayers) {
            if (line.contains(banned)) {
              violations.add('${file.path}: $line');
            }
          }
        }
      }
      expect(violations, isEmpty, reason: violations.join('\n'));
    });

    test('domain/ does not import features/', () {
      final violations = <String>[];
      for (final file in _dartFilesIn('lib/domain')) {
        for (final line in _importsOf(file)) {
          if (line.contains('package:been_here/features/')) {
            violations.add('${file.path}: $line');
          }
        }
      }
      expect(violations, isEmpty, reason: violations.join('\n'));
    });

    test('data/ does not import widgets or features', () {
      final violations = <String>[];
      for (final file in _dartFilesIn('lib/data')) {
        for (final line in _importsOf(file)) {
          for (final banned in _bannedInDataLayer) {
            if (line.contains(banned)) {
              violations.add('${file.path}: $line');
            }
          }
        }
      }
      expect(violations, isEmpty, reason: violations.join('\n'));
    });

    test('core/ does not import data/ or domain/', () {
      final violations = <String>[];
      for (final file in _dartFilesIn('lib/core')) {
        for (final line in _importsOf(file)) {
          if (line.contains('package:been_here/data/') ||
              line.contains('package:been_here/domain/')) {
            violations.add('${file.path}: $line');
          }
        }
      }
      expect(violations, isEmpty, reason: violations.join('\n'));
    });
  });
}
