import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/core/constants/portfolio_data.dart';
import 'package:portfolio_v2/sites/minimalisto/features/contact/services/contact_service.dart';

class ContactController extends GetxController {
  final ContactService _contactService;

  ContactController({ContactService? contactService})
      : _contactService = contactService ?? ContactService();

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isSuccess = false.obs;
  final RxString statusMessage = ''.obs;

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateSubject(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a subject';
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your message';
    }
    if (value.trim().length < 10) {
      return 'Message should be at least 10 characters';
    }
    return null;
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final targetEmail = user.email;
    if (targetEmail == null || targetEmail.isEmpty) {
      statusMessage.value = 'Recipient email is not configured.';
      Get.snackbar(
        'Error',
        'Recipient email is not configured.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    statusMessage.value = '';

    try {
      final success = await _contactService.sendEmail(
        toEmail: targetEmail,
        name: nameController.text.trim(),
        company: companyController.text.trim(),
        senderEmail: emailController.text.trim(),
        phone: phoneController.text.trim(),
        subject: subjectController.text.trim(),
        message: messageController.text.trim(),
      );

      if (success) {
        isSuccess.value = true;
        statusMessage.value = 'Your message has been sent successfully!';
        nameController.clear();
        companyController.clear();
        emailController.clear();
        phoneController.clear();
        subjectController.clear();
        messageController.clear();
        formKey.currentState?.reset();

        Get.snackbar(
          'Message Sent',
          'Thank you! Your message has been delivered.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.shade800,
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
        );
      }
    } catch (e) {
      isSuccess.value = false;
      statusMessage.value = 'Failed to send message. Please try again.';
      Get.snackbar(
        'Error',
        'Failed to send message: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    companyController.dispose();
    emailController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
