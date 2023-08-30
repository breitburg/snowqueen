import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_spinner/cli_spinner.dart';
import 'package:http/http.dart';
import 'package:archive/archive_io.dart';
import 'package:snowqueen/toolkit/kaios2/manifest.dart';

class CompileKaiOS2Command extends Command {
  @override
  String get name => 'kaios2';

  @override
  String get description => 'Compile the project for KaiOS 2.5.';

  CompileKaiOS2Command() {
    argParser.addOption(
      'output',
      abbr: 'o',
      help: 'Specify the output path for saving the compiled application.',
    );

    argParser.addFlag(
      'omnisd',
      help: 'Compile for OmniSD.',
      defaultsTo: false,
      negatable: false,
    );
  }

  @override
  Future<void> run() async {
    final appName = Directory.current.absolute.path.split('/').last;
    final spinner = Spinner.type(
      'Compiling $appName for KaiOS 2.5...',
      SpinnerType.dots,
    )..start();

    final file = File(argResults!.rest[0]);
    assert(await file.exists());

    spinner.updateMessage('Creating temporary directory...');
    final directory = await Directory('.snowqueen').create();

    spinner.updateMessage('Compiling project into JavaScript...');
    final result = await Process.run(
      'dart',
      ['compile', 'js', file.path, '-o', '${directory.path}/main.dart.js'],
    );
    assert(result.exitCode == 0);

    spinner.updateMessage('Downloading & copying files...');

    // Download HTML bundle
    final htmlBundle = await get(Uri.https('raw.githubusercontent.com',
        '/breitburg/snowqueen/main/assets/index.html'));
    await File('${directory.path}/index.html').writeAsString(htmlBundle.body);

    // Download CSS bundle
    final cssBundle = await get(Uri.https('raw.githubusercontent.com',
        'canicjusz/KaiOS-native-UI/main/kaios-native-ui.css'));
    await File('${directory.path}/stylesheet.css')
        .writeAsString(cssBundle.body);

    // Create manifest
    spinner.updateMessage('Creating manifest...');
    await File('${directory.path}/manifest.webapp').writeAsString(
      jsonEncode(Manifest(
        name: appName,
        description: 'A SnowQueen application.',
        launchPath: '/index.html',
        icons: Icons.fallback(),
        developer: Developer(name: 'Developer', url: 'https://example.com'),
      ).toJson()),
    );

    // Encode everything into a ZIP file
    final outputPath = argResults!['output'] ?? '$appName.zip';
    final encoder = ZipFileEncoder();
    encoder.zipDirectory(directory, filename: outputPath);

    spinner.updateMessage('Cleaning up...');
    await directory.delete(recursive: true);

    spinner.updateMessage('Done! Application is at $outputPath.');
    spinner.stop();
  }
}
