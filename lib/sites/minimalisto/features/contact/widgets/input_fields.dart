import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/sites/minimalisto/core/theme/theme.dart';
import 'package:portfolio_v2/sites/minimalisto/features/contact/controllers/contact_controller.dart';

class InputFields extends StatelessWidget {
  const InputFields({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContactController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 600;

        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              if (isNarrow) ...[
                TextFormField(
                  controller: controller.nameController,
                  validator: controller.validateName,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    hintText: 'John Doe',
                  ),
                ),
                TextFormField(
                  controller: controller.companyController,
                  decoration: const InputDecoration(
                    labelText: 'Company / Organization (Optional)',
                    hintText: 'Acme Inc.',
                  ),
                ),
                TextFormField(
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Your Email',
                    hintText: 'john@example.com',
                  ),
                ),
                TextFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number (Optional)',
                    hintText: '+1 234 567 8900',
                  ),
                ),
              ] else ...[
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.nameController,
                        validator: controller.validateName,
                        decoration: const InputDecoration(
                          labelText: 'Your Name',
                          hintText: 'John Doe',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.companyController,
                        decoration: const InputDecoration(
                          labelText: 'Company / Organization (Optional)',
                          hintText: 'Acme Inc.',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.emailController,
                        validator: controller.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Your Email',
                          hintText: 'john@example.com',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number (Optional)',
                          hintText: '+1 234 567 8900',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              TextFormField(
                controller: controller.subjectController,
                validator: controller.validateSubject,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  hintText: 'Project inquiry / Opportunity',
                ),
              ),
              TextFormField(
                controller: controller.messageController,
                validator: controller.validateMessage,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  hintText: 'Tell me about your project, ideas, or timeline...',
                  alignLabelWithHint: true,
                ),
              ),
              Obx(() {
                if (controller.statusMessage.value.isNotEmpty) {
                  return Text(
                    controller.statusMessage.value,
                    style: AppTexts.tsmr.copyWith(
                      color: controller.isSuccess.value
                          ? context.colors.success
                          : context.colors.error,
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
              Align(
                alignment: Alignment.centerRight,
                child: Obx(() {
                  return ElevatedButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.submit,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.send_rounded, size: 18),
                              const SizedBox(width: 8),
                              Text("Send Message", style: AppTexts.tsmm),
                            ],
                          ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
