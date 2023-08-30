import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiButtonContainer implements KaiElement {
  final List<KaiElement> buttons;

  const KaiButtonContainer({required this.buttons});

  @override
  HtmlElement build() {
    return DivElement()
      ..classes = ['button-container']
      ..children = buttons.map((e) => e.build()).toList();
  }
}
