class Company {
  final String? svgAsset;
  final String name;
  final String? url;
  const Company({this.svgAsset, required this.name, this.url});
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      svgAsset: json['svgAsset'] as String?,
      name: json['name'] as String,
      url: json['url'] as String?,
    );
  }
  Map<String, dynamic> toJson() => {
    'svgAsset': svgAsset,
    'name': name,
    'url': url,
  };
  Company copyWith({String? svgAsset, String? name, String? url}) {
    return Company(
      svgAsset: svgAsset ?? this.svgAsset,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
