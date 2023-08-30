import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiListItemWithIndicator implements KaiElement {
  final String text;
  final String? subtext;

  const KaiListItemWithIndicator(this.text, {this.subtext});

  @override
  HtmlElement build() {
    return DivElement()
      ..classes = ['list-item-indicator', 'focusable']
      ..tabIndex = 0
      ..children = [
        ParagraphElement()
          ..className = 'list-item-indicator__text'
          ..text = text,
        if (subtext != null)
          ParagraphElement()
            ..className = 'list-item-indicator__subtext'
            ..text = subtext,
        SpanElement()..className = 'list-item-indicator__indicator',
      ];
  }
}
