import 'package:args/command_runner.dart';
import 'package:snowqueen/commands/compile.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    'snowqueen',
    'Build KaiOS apps without pain.',
  );

  runner.addCommand(CompileCommand());

  runner.run(arguments);
}
