import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MyFamilyWidget extends StatelessWidget {
  const MyFamilyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TokioMarineSpacing.of_4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Minha Família',
            style: TextStyle(
              color: TokioMarineColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: TokioMarineSpacing.of_3),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: TokioMarineSpacing.of_8),
            decoration: BoxDecoration(
              color: TokioMarineColors.intenseDark,
              borderRadius: BorderRadius.circular(TokioMarineSpacing.of_4),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: TokioMarineColors.white,
                  size: 32,
                ),
                SizedBox(height: TokioMarineSpacing.of_3),
                Text(
                  'Adicione aqui membros da sua família e compartilhe '
                  'os seguros com eles.',
                  style: TextStyle(
                    color: Colors.white70,
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
