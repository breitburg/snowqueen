import 'dart:html';

import 'package:snowqueen/framework/scaffold.dart';

class KaiApp {
  KaiApp() {
    // TODO: Implement theming
    final style = document.documentElement!.style;
    style.setProperty('--header-background', '#320574');
  }

  void show(KaiScaffold scaffold) {
    final root = querySelector('#app')!;
    root.replaceWith(scaffold.build());
  }
}
