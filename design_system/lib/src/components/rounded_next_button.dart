import 'package:flutter/material.dart';

import '../colors/colors.dart';

class RoundedNextButton extends StatelessWidget {
  const RoundedNextButton({
    this.onPressed,
    this.loading = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: TokioMarineColors.linearGradient,
      ),
      child: loading
          ? const CircularProgressIndicator()
          : IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: onPressed,
              iconSize: 40,
            ),
    );
  }
}
