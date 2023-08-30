import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiListItemWithCheckbox implements KaiElement {
  final String text;
  final String? subtext;

  const KaiListItemWithCheckbox(this.text, {this.subtext});

  @override
  HtmlElement build() {
    return DivElement()
      ..classes = ['checkbox-container']
      ..children = [
        ParagraphElement()
          ..className = 'checkbox-container__text'
          ..text = text,
        if (subtext != null)
          ParagraphElement()
            ..className = 'checkbox-container__subtext'
            ..text = subtext,
        CheckboxInputElement()
          ..tabIndex = 0
          ..classes = ['focusable', 'checkbox-container__input'],
        DivElement()..className = 'checkbox-container__checkbox',
      ];
  }
}
