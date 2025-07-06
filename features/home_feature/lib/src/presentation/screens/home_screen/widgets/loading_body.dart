import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

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
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
