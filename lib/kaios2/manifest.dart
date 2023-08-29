class Manifest {
  final String name;
  final String description;
  final String launchPath;
  final Icons icons;
  final Developer developer;

  Manifest({
    required this.name,
    required this.description,
    required this.launchPath,
    required this.icons,
    required this.developer,
  });

  factory Manifest.fromJson(Map<String, dynamic> json) {
    return Manifest(
      name: json['name'],
      description: json['description'],
      launchPath: json['launch_path'],
      icons: Icons.fromJson(json['icons']),
      developer: Developer.fromJson(json['developer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'launch_path': launchPath,
      'icons': icons.toJson(),
      'developer': developer.toJson()
    };
  }
}

class Icons {
  final String size16;
  final String size48;
  final String size60;
  final String size128;

  const Icons({
    required this.size16,
    required this.size48,
    required this.size60,
    required this.size128,
  });

  factory Icons.fallback() {
    return Icons(
      size16: '/icons/icon16x16.png',
      size48: '/icons/icon48x48.png',
      size60: '/icons/icon60x60.png',
      size128: '/icons/icon128x128.png',
    );
  }

  factory Icons.fromJson(Map<String, dynamic> json) {
    return Icons(
      size16: json['16'],
      size48: json['48'],
      size60: json['60'],
      size128: json['128'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'16': size16, '48': size48, '60': size60, '128': size128};
  }
}

class Developer {
  final String name;
  final String url;

  Developer({required this.name, required this.url});

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
