import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiListItemWithIcon implements KaiElement {
  final String text;
  final String? subtext;
  final String url;

  const KaiListItemWithIcon(
    this.text, {
    required this.url,
    this.subtext,
  });

  @override
  HtmlElement build() {
    return DivElement()
      ..classes = ['list-item-icon', 'focusable']
      ..tabIndex = 0
      ..children = [
        ImageElement(src: url)..className = 'list-item-icon__icon',
        DivElement()
          ..className = 'list-item-icon__text-container'
          ..children = [
            ParagraphElement()
              ..className = 'list-item-icon__text'
              ..text = text,
            if (subtext != null)
              ParagraphElement()
                ..className = 'list-item-icon__subtext'
                ..text = subtext,
          ],
      ];
  }
}
