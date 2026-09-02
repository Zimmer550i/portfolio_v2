import 'package:portfolio_v2/core/models/enums/media_type.dart';

class Media {
  final MediaType? type;
  final String? assetName;
  final String? url;
  final String? thumbnail;
  const Media({this.type, this.assetName, this.url, this.thumbnail});
  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'] != null
          ? MediaType.values.byName(json['type'] as String)
          : null,
      assetName: json['assetName'] as String?,
      url: json['url'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );
  }
  Map<String, dynamic> toJson() => {
    'type': type?.name,
    'assetName': assetName,
    'url': url,
    'thumbnail': thumbnail,
  };
  Media copyWith({
    MediaType? type,
    String? assetName,
    String? url,
    String? thumbnail,
  }) {
    return Media(
      type: type ?? this.type,
      assetName: assetName ?? this.assetName,
      url: url ?? this.url,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
