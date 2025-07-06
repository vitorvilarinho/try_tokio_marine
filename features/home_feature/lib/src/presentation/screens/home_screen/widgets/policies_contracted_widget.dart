import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PoliciesContractedWidget extends StatelessWidget {
  const PoliciesContractedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TokioMarineSpacing.of_4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contratados',
            style: TextStyle(
              color: TokioMarineColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: TokioMarineSpacing.of_3),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: TokioMarineSpacing.of_8,
            ),
            decoration: BoxDecoration(
              color: TokioMarineColors.intenseDark,
              borderRadius: BorderRadius.circular(
                TokioMarineSpacing.of_4,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(height: 12),
                Text(
                  'Você ainda não possui seguros contratados.',
                  style: TextStyle(
                    color: TokioMarineColors.gray,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
