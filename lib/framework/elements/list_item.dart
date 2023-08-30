import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiListItem implements KaiElement {
  final String text;
  final String? subtext;

  const KaiListItem(this.text, {this.subtext});

  @override
  HtmlElement build() {
    return DivElement()
      ..classes = ['list-item', 'focusable']
      ..tabIndex = 0
      ..children = [
        ParagraphElement()
          ..className = 'list-item__text'
          ..text = text,
        if (subtext != null)
          ParagraphElement()
            ..className = 'list-item__subtext'
            ..text = subtext,
      ];
  }
}
