import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({
    required this.failure,
    super.key,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TokioMarineColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: TokioMarineColors.backgroundColor,
        elevation: 0,
        title: TokioMarineLogo.white(
          height: TokioMarineSpacing.of_7,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          failure.message,
          style: const TextStyle(
            color: TokioMarineColors.pink,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
