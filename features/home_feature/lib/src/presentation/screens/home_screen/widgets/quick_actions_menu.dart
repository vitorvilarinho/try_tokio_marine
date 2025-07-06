import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/quick_action.dart';

class QuickActionsMenu extends StatelessWidget {
  QuickActionsMenu({super.key});

  final _quickActions = [
    const QuickAction(
      title: 'Automóvel',
      icon: Icons.directions_car,
      deeplink: 'https://jsonplaceholder.typicode.com/',
    ),
    const QuickAction(
      title: 'Residência',
      icon: Icons.home,
      deeplink: '',
    ),
    const QuickAction(
      title: 'Vida',
      icon: Icons.favorite,
      deeplink: '',
    ),
    const QuickAction(
      title: 'Acidentes\nPessoais',
      icon: Icons.healing,
      deeplink: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TokioMarineSpacing.of_4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cotar e Contratar',
            style: TextStyle(
              color: TokioMarineColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: TokioMarineSpacing.of_3),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _quickActions
                  .map(
                    (action) => _FeatureCard(
                      quickAction: action,
                      onPressed: (action) async {
                        if (action.deeplink.isNotEmpty) {
                          if (Uri.tryParse(action.deeplink) case final uri?) {
                            await launchUrl(uri);
                          }
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.quickAction,
    required this.onPressed,
  });

  final QuickAction quickAction;
  final Function(QuickAction) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TokioMarineSpacing.of_2),
      child: GestureDetector(
        onTap: () => onPressed(quickAction),
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: TokioMarineColors.intenseDark,
            borderRadius: BorderRadius.circular(TokioMarineSpacing.of_3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                quickAction.icon,
                color: TokioMarineColors.green,
                size: 32,
              ),
              const SizedBox(height: 4),
              Text(
                quickAction.title,
                style: const TextStyle(
                  color: TokioMarineColors.gray,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
