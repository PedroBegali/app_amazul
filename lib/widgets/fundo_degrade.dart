import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FundoDegrade extends StatelessWidget {
  final Widget child;

  const FundoDegrade({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.degradeFundo),
      child: child,
    );
  }
}
