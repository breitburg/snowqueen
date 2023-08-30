import 'dart:html';

import 'package:snowqueen/framework/element.dart';
import 'package:snowqueen/framework/elements/header.dart';
import 'package:snowqueen/framework/elements/softkeys.dart';

class KaiScaffold implements KaiElement {
  final KaiHeader header;
  final KaiElement body;
  final KaiSoftkeys softkeys;

  KaiScaffold({
    required this.header,
    required this.body,
    required this.softkeys,
  }) {
    document.activeElement!.addEventListener(
        'keydown', (event) => _handleDPad(event as KeyboardEvent));
  }

  void _handleDPad(KeyboardEvent event) {
    final move = switch (event.key) {
      'ArrowUp' => -1,
      'ArrowDown' => 1,
      'ArrowLeft' => -1,
      'ArrowRight' => 1,
      _ => 0,
    };

    final items = document.querySelectorAll('.focusable');
    final next = items.indexOf(document.activeElement) + move;

    if (next < 0 || next >= items.length) return;
    items.elementAt(next).focus();
  }

  @override
  HtmlElement build() {
    return DivElement()
      ..id = 'app'
      ..children = [header, body, softkeys].map((e) => e.build()).toList();
  }
}
