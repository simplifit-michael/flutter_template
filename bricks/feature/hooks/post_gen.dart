import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Adding missing dependencies');

  // Run `flutter packages get` after generation.
  // ignore: cascade_invocations

  progress.update('Running flutter pub get');
  await Process.run('flutter', ['packages', 'get']);

  progress.update('Running build_runner');
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
