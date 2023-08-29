import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:http/http.dart';

class CompileKaiOS2Command extends Command {
  @override
  String get name => 'kaios2';

  @override
  String get description => 'Compile the project for KaiOS 2.5.';

  @override
  Future<void> run() async {
    print('Compiling for KaiOS 2.5...');

    final file = File(argResults!.rest[0]);
    assert(await file.exists());

    print('Creating temporary directory...');
    final directory = await Directory('.snowqueen').create();

    print('Compiling project into JavaScript...');
    final result = await Process.run(
      'dart',
      ['compile', 'js', file.path, '-o', '${directory.path}/main.dart.js'],
    );
    assert(result.exitCode == 0);

    print('Downloading & copying files...');

    final htmlBundle = await get(Uri.https('raw.githubusercontent.com',
        '/breitburg/snowqueen/main/assets/index.html'));
    await File('${directory.path}/index.html').writeAsString(htmlBundle.body);

    final cssBundle = await get(Uri.https('raw.githubusercontent.com',
        '/breitburg/snowqueen/main/assets/stylesheet.css'));
    await File('${directory.path}/stylesheet.css')
        .writeAsString(cssBundle.body);

    print('Done!');
  }
}
