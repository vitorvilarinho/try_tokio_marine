import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:user/user.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    required this.profile,
    super.key,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        gradient: TokioMarineColors.linearGradient,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/32.jpg',
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem-vindo',
                style: TextStyle(
                  color: TokioMarineColors.gray,
                  fontSize: 14,
                ),
              ),
              Text(
                profile.fullName,
                style: const TextStyle(
                  color: TokioMarineColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
