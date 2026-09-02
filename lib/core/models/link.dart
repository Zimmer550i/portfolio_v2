class Link {
  final String? svgAsset;
  final String? name;
  final String url;
  const Link({this.svgAsset, this.name, required this.url});
  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      svgAsset: json['svgAsset'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
    'svgAsset': svgAsset,
    'name': name,
    'url': url,
  };
  Link copyWith({String? svgAsset, String? name, String? url}) {
    return Link(
      svgAsset: svgAsset ?? this.svgAsset,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
