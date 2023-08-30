import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiButton implements KaiElement {
  final String text;
  final void Function() onClick;

  const KaiButton({
    required this.text,
    required this.onClick,
  });

  @override
  HtmlElement build() {
    return ButtonElement()
      ..classes = ['button-container__button', 'focusable']
      ..tabIndex = 0
      ..text = text
      ..onClick.listen((event) => onClick());
  }
}
