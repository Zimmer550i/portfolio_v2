import 'package:flutter/material.dart';
import 'package:portfolio_v2/sites/minimalisto/features/home/widgets/hero_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(),
          // Future sections go here — each will be screen height
        ],
      ),
    );
  }
}