import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Adding missing dependencies');

  // Run `flutter packages get` after generation.
  // ignore: cascade_invocations
  progress.update('Adding Missing Dependencies...');
  await Process.run('flutter', ['pub', 'add', 'dartz']);
  await Process.run('flutter', ['pub', 'add', 'dio']);
  await Process.run('flutter', ['pub', 'add', 'freezed_annotations']);
  await Process.run('flutter', ['pub', 'add', 'flutter_bloc']);
  await Process.run('flutter', ['pub', 'add', 'hive_flutter']);

  progress.update('Adding Missing Dev Dependencies...');
  await Process.run('flutter', ['pub', 'add', 'dev:build_runner']);
  await Process.run('flutter', ['pub', 'add', 'dev:freezed']);
  await Process.run('flutter', ['pub', 'add', 'dev:hive_generator']);

  progress.update('Running flutter pub get...');
  await Process.run('flutter', ['packages', 'get']);

  progress.update('Running build_runner...');
  await Process.run(
    'flutter',
    [
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ],
  );

  progress.complete();
}
