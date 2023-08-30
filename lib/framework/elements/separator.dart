import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiSeparator implements KaiElement {
  final String text;

  KaiSeparator({required this.text});

  @override
  HtmlElement build() {
    return DivElement()
      ..className = 'separator'
      ..text = text;
  }
}
