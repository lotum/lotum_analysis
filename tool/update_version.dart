import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';

void main() {
  updateReadme();
  updateVersionedAnalysisOptions();
  updateCurrentAnalysisOptions();
}

late final version = loadYamlDocument(File('pubspec.yaml').readAsStringSync())
    .contents
    .value['version']
    .toString();

void updateReadme() {
  final file = File('README.md');
  final content = file.readAsStringSync();
  final updatedContent = content.replaceAllMapped(
    RegExp(r'lotum_analysis(: \^|.)\d+\.\d+\.\d+'),
    (match) => 'lotum_analysis:${match[1]}$version',
  );
  file.writeAsStringSync(updatedContent);
  gitAdd(file.path);
}

void updateCurrentAnalysisOptions() {
  final file = File('lib/lotum_analysis.yaml');
  final content = file.readAsStringSync();
  final updatedContent = content.replaceFirstMapped(
    RegExp(r'package:lotum_analysis/lotum_analysis\..*\.yaml'),
    (_) => 'package:lotum_analysis/lotum_analysis.$version.yaml',
  );
  file.writeAsStringSync(updatedContent);
  gitAdd(file.path);
}

void updateVersionedAnalysisOptions() {
  final nextFile = File('lib/lotum_analysis.next.yaml');
  final versionedFile = File('lib/lotum_analysis.$version.yaml');
  versionedFile.writeAsBytesSync(nextFile.readAsBytesSync());
  gitAdd(versionedFile.path);
}

void gitAdd(String path) => exec('git', ['add', path]);

void exec(String command, List<String> arguments) {
  final result = Process.runSync(
    command,
    arguments,
    runInShell: Platform.isWindows,
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
  );

  if (result.exitCode != 0) {
    throw Exception(
      'Failed to execute "$command ${arguments.join(' ')}":\n'
      '${result.stdout}\n${result.stderr}',
    );
  }
}
