import 'dart:html';

class App {
  late final _app = querySelector('#app')!..children.clear();
  late final DivElement _toast;
  late final DivElement _content;

  final Function(App app)? onLeft, onRight, onEnter;
  final String? left, right, enter;

  int _tabIndex = 0;
  int focused = 0;

  App(
    String header, {
    this.left = 'Left',
    this.right = 'Right',
    this.enter = 'Enter',
    this.onLeft,
    this.onRight,
    this.onEnter,
  }) {
    document.head!.title = 'Snowqueen';

    final headerDiv = DivElement()
      ..id = 'header'
      ..text = header;

    _app.children.add(headerDiv);

    _toast = DivElement()..className = 'toast';
    _toast.text = 'This is a toast message';
    _app.children.add(_toast);

    _content = DivElement()..id = 'content';
    _app.children.add(_content);

    final softkeys = DivElement()..className = 'softkeys';

    softkeys.children.addAll([
      if (left != null)
        DivElement()
          ..className = 'softkey softkey-left'
          ..innerText = left!,
      if (enter != null)
        DivElement()
          ..className = 'softkey softkey-center'
          ..innerText = enter!,
      if (right != null)
        DivElement()
          ..className = 'softkey softkey-right'
          ..innerText = right!,
    ]);
    _app.children.add(softkeys);

    void handleKeyDown(evt) {
      final target = switch (evt.key) {
        'SoftLeft' => onLeft,
        'SoftRight' => onRight,
        'Enter' => (_) => _content.children.elementAt(focused).click,
        _ => null,
      };

      if (target == null) return;
      target(this);
    }

    document.addEventListener('keydown', handleKeyDown);

    void handleKeydown(e) {
      switch (e.key) {
        case 'ArrowUp':
          nav(-1);
          break;
        case 'ArrowDown':
          nav(1);
          break;
        case 'ArrowRight':
          nav(1);
          break;
        case 'ArrowLeft':
          nav(-1);
          break;
      }
    }

    document.activeElement!.addEventListener('keydown', handleKeydown);
  }

  void nav(int move) {
    _content.children.elementAt(focused += move).focus();
  }

  void showToast(String message) {
    _toast.text = message;
    _toast.classes.toggle('toast--on');
    Future.delayed(const Duration(seconds: 3)).then((_) {
      _toast.classes.toggle('toast--on');
    });
  }

  void addMenuItem(String title, {String? subtitle, VoidCallback? onClick}) {
    final listItem = DivElement()
      ..classes.add('list-item')
      ..tabIndex = _tabIndex++;

    listItem.children.addAll([
      ParagraphElement()
        ..classes.add('list-item__text')
        ..text = title,
      if (subtitle != null) ...[
        ParagraphElement()
          ..classes.add('list-item__subtext')
          ..text = subtitle
      ],
    ]);

    if (onClick != null) {
      listItem.onClick.listen((_) => onClick());
    }

    _content.children.add(listItem);
  }

  void addDivider(String title) {
    DivElement divElement = DivElement()
      ..className = 'separator'
      ..text = title;

    _content.children.add(divElement);
  }

  void addText(String text) {
    _content.children.add(ParagraphElement()
      ..classes.add('list-item__text')
      ..text = text);
  }

  void addButtons(List<String> buttons) {
    DivElement buttonContainer = DivElement()..className = 'button-container';

    buttonContainer.children.addAll([
      for (final text in buttons)
        ButtonElement()
          ..tabIndex = _tabIndex++
          ..classes.add('button-container__button')
          ..classes.add('focusable')
          ..text = text
    ]);

    _content.children.add(buttonContainer);
  }
}
