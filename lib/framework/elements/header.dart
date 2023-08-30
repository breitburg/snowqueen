import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiHeader implements KaiElement {
  final String title;

  const KaiHeader(this.title);

  @override
  HtmlElement build() {
    return DivElement()
      ..id = 'header'
      ..text = title;
  }
}
