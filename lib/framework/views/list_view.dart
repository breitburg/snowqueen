import 'dart:html';

import 'package:snowqueen/framework/element.dart';

class KaiListView implements KaiElement {
  final List<KaiElement> children;

  const KaiListView({required this.children});

  @override
  HtmlElement build() {
    return DivElement()
      ..id = 'content'
      ..children = children.map((child) => child.build()).toList();
  }
}
