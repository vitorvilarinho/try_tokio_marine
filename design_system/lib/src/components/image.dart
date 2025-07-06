import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TokioMarineImage extends StatelessWidget {
  const TokioMarineImage(
    this.path, {
    Key? key,
    this.height,
    this.width,
    this.alignment = Alignment.center,
    this.color,
    this.scale = 1.0,
    this.package,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  static const _defaultPackage = 'design_system';

  /// The URL or local path of the asset.
  final String path;

  /// The name of the package from which the picture is included.
  final String? package;

  /// If specified, the width to use for the SVG.  If unspecified, the SVG
  /// will take the width of its parent.
  final double? width;

  /// If specified, the height to use for the SVG.  If unspecified, the SVG
  /// will take the height of its parent.
  final double? height;

  /// How to align the picture within its parent widget.
  final Alignment alignment;

  /// Factor to scale icon size.
  final double scale;

  /// The color to apply to the image.
  final Color? color;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return const SizedBox();
    }
    if (_isSVG(path)) {
      return SvgPicture.asset(
        path,
        package: _defaultPackage,
        height: height,
        width: width,
        alignment: alignment,
        fit: fit,
      );
    }

    if (_isNetworkImage(path)) {
      return CachedNetworkImage(
        imageUrl: path,
        height: height,
        width: width,
        alignment: alignment,
        color: color,
        fit: fit,
      );
    }
    return Image.asset(
      path,
      fit: fit,
      package: package ?? _defaultPackage,
      color: color,
      height: height,
      width: width,
      alignment: alignment,
      scale: scale,
    );
  }

  bool _isNetworkImage(String path) => path.isNotEmpty && path.contains('http');

  bool _isSVG(String path) => path.isNotEmpty && path.contains('svg');
}
