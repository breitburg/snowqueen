import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_spinner/cli_spinner.dart';
import 'package:http/http.dart';

class CreateCommand extends Command {
  @override
  String get name => 'create';

  @override
  String get description => 'Create a new project.';

  @override
  Future<void> run() async {
    final targetDirectory = argResults!.rest[0];
    final spinner = Spinner.type('Creating new project...', SpinnerType.dots)
      ..start();

    spinner.updateMessage('Creating new project at $targetDirectory...');
    await Process.run('dart', ['create', '-t', 'web', targetDirectory]);

    final webDirectory = Directory('$targetDirectory/web');

    // Download HTML bundle
    spinner.updateMessage('Downloading HTML bundle...');
    final htmlBundle = await get(Uri.https('raw.githubusercontent.com',
        '/breitburg/snowqueen/main/assets/index.html'));
    await File('${webDirectory.path}/index.html')
        .writeAsString(htmlBundle.body);

    // Download CSS bundle
    spinner.updateMessage('Downloading CSS bundle...');
    final cssBundle = await get(Uri.https('raw.githubusercontent.com',
        'canicjusz/KaiOS-native-UI/main/kaios-native-ui.css'));
    await File('${webDirectory.path}/stylesheet.css')
        .writeAsString(cssBundle.body);

    spinner.updateMessage('Adding dependencies...');
    await Process.run(
      'dart',
      ['pub', 'add', 'snowqueen'],
      workingDirectory: '$targetDirectory/',
    );

    spinner.updateMessage('Done!');
    spinner.stop();
  }
}
