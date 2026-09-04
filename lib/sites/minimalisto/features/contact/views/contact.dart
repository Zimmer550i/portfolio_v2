import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/core/constants/portfolio_data.dart';
import 'package:portfolio_v2/sites/minimalisto/core/theme/theme.dart';
import 'package:portfolio_v2/sites/minimalisto/features/contact/controllers/contact_controller.dart';
import 'package:portfolio_v2/sites/minimalisto/features/contact/widgets/input_fields.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactController());

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 700;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isSmall ? 24.0 : 48.0,
            vertical: 48.0,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's Connect",
                    style: isSmall ? AppTexts.dmds : AppTexts.dlgs,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Have a project in mind, a question, or just want to say hi? Send me a message and I'll get back to you as soon as possible.",
                    style: AppTexts.tsmr.copyWith(
                      color: context.colors.neutral.shade500,
                    ),
                  ),
                  if (user.email != null && user.email!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline_rounded,
                          size: 18,
                          color: context.colors.primary,
                        ),
                        const SizedBox(width: 8),
                        SelectableText(
                          user.email!,
                          style: AppTexts.tsmm.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 32),
                  const InputFields(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
