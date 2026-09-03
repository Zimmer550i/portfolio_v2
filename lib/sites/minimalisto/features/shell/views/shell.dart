import 'package:flutter/material.dart';
import 'package:portfolio_v2/core/theme/theme.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/widgets/side_nav_bar.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: SideNavBar(),
            ),
          ),
          SizedBox(
            width: 5,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  height: double.infinity,
                  width: 5,
                  color: context.colors.primary.shade300,
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  width: 5,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: context.colors.primary.withValues(alpha: 0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
