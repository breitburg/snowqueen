import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiInput implements KaiElement {
  @override
  HtmlElement build() {
    return InputElement()
      ..classes = ['input-container__input', 'focusable']
      ..tabIndex = 0
      ..type = 'text';
  }
}
