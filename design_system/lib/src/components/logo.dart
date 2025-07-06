import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TokioMarineLogo extends StatelessWidget {
  const TokioMarineLogo._({
    required this.fileName,
    this.width,
    this.height,
    super.key,
  });

  factory TokioMarineLogo.white({
    double? width,
    double? height,
    Key? key,
  }) =>
      TokioMarineLogo._(
        fileName: 'assets/logo-tokiomarine-white.svg',
        height: height,
        width: width,
        key: key,
      );

  factory TokioMarineLogo.colored({
    double? width,
    double? height,
    Key? key,
  }) =>
      TokioMarineLogo._(
        fileName: 'assets/logo-tokiomarine.svg',
        height: height,
        width: width,
        key: key,
      );

  final String fileName;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      fileName,
      package: 'design_system',
      width: width,
      height: height,
    );
  }
}
