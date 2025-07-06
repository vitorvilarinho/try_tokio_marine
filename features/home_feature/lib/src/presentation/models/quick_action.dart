import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class QuickAction extends Equatable {
  const QuickAction({
    required this.title,
    required this.icon,
    required this.deeplink,
  });

  final String title;
  final IconData icon;
  final String deeplink;

  @override
  List<Object?> get props => [
        title,
        icon,
        deeplink,
      ];
}
