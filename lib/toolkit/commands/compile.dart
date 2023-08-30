import 'package:args/command_runner.dart';
import 'package:snowqueen/toolkit/kaios2/command.dart';

class CompileCommand extends Command {
  @override
  String get name => 'compile';

  @override
  String get description => 'Compile the project.';

  CompileCommand() {
    addSubcommand(CompileKaiOS2Command());
  }
}
