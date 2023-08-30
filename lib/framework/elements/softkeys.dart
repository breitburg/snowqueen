import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiSoftkeys implements KaiElement {
  final String left, center, right;

  const KaiSoftkeys({
    this.left = 'Left',
    this.center = 'Enter',
    this.right = 'Right',
  });

  @override
  HtmlElement build() {
    return DivElement()
      ..className = 'softkeys'
      ..children = [
        DivElement()
          ..classes.addAll(['softkey', 'softkey-left'])
          ..text = left,
        DivElement()
          ..classes.addAll(['softkey', 'softkey-center'])
          ..text = center,
        DivElement()
          ..classes.addAll(['softkey', 'softkey-right'])
          ..text = right,
      ];
  }
}
