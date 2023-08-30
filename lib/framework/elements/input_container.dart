import 'dart:html';

import 'package:snowqueen/framework/element.dart';
import 'package:snowqueen/framework/elements/input.dart';

class KaiInputContainer implements KaiElement {
  final String label;

  KaiInputContainer({required this.label});

  @override
  HtmlElement build() {
    return DivElement()
      ..className = 'input-container'
      ..children = [
        LabelElement()
          ..className = 'input-container__label'
          ..text = label,
        KaiInput().build(),
      ];
  }
}
