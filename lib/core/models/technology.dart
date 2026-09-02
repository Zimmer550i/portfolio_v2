class Technology {
  final String? svgAsset;
  final String name;
  const Technology({this.svgAsset, required this.name});
  factory Technology.fromJson(Map<String, dynamic> json) {
    return Technology(
      svgAsset: json['svgAsset'] as String?,
      name: json['name'] as String,
    );
  }
  Map<String, dynamic> toJson() => {'svgAsset': svgAsset, 'name': name};
  Technology copyWith({String? svgAsset, String? name}) {
    return Technology(
      svgAsset: svgAsset ?? this.svgAsset,
      name: name ?? this.name,
    );
  }
}
