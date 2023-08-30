import 'package:args/command_runner.dart';
import 'package:snowqueen/toolkit/commands/compile.dart';
import 'package:snowqueen/toolkit/commands/create.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    'snowqueen',
    'Build KaiOS apps without pain.',
  );

  runner.addCommand(CompileCommand());
  runner.addCommand(CreateCommand());

  runner.run(arguments);
}
