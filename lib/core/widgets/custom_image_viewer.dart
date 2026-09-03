import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// CustomImageViewer accepts both asset path and urls
class CustomImageViewer extends StatelessWidget {
  final String? data;
  final double? height;
  final double? width;
  final double? size;
  final double radius;
  const CustomImageViewer(
    this.data, {
    super.key,
    this.height,
    this.width,
    this.size,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: size ?? height,
        width: size ?? width,
        child: _checkData(data),
      ),
    );
  }

  Widget _networkImage(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) {
        return _loadingWidget(
          amount: progress.totalSize != null
              ? (progress.downloaded / progress.totalSize!)
              : null,
        );
      },
      errorWidget: (context, url, error) =>
          _errorWidget(error: error.toString()),
    );
  }

  Widget _assetImage(String path) {
    return Image.asset(path);
  }

  Widget _errorWidget({String? error}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
    );
  }

  Widget _loadingWidget({double? amount}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      child: CircularProgressIndicator(value: amount),
    );
  }

  Widget _checkData(String? data) {
    if (data == null) {
      return _errorWidget();
    }

    if (data.contains("http")) {
      return _networkImage(data);
    }

    return _assetImage(data);
  }
}
