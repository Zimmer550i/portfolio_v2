import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ContactService {
  final http.Client _client;

  ContactService({http.Client? client}) : _client = client ?? http.Client();

  /// Sends a contact email to [toEmail] via the FormSubmit AJAX service.
  /// Returns `true` if successfully sent, or throws an exception on failure.
  Future<bool> sendEmail({
    required String toEmail,
    required String name,
    required String senderEmail,
    required String phone,
    required String company,
    required String subject,
    required String message,
  }) async {
    try {
      final uri = Uri.parse('https://formsubmit.co/ajax/$toEmail');
      final response = await _client.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': senderEmail,
          'phone': phone,
          'company_or_organization': company,
          '_subject': subject.isNotEmpty
              ? subject
              : 'New Message from Portfolio Contact Form',
          'message': message,
          '_template': 'table',
          '_captcha': 'false',
        }),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        debugPrint('Failed to send email: ${response.statusCode} ${response.body}');
        throw Exception('Failed to send message (${response.statusCode})');
      }
    } catch (e) {
      debugPrint('ContactService exception: $e');
      rethrow;
    }
  }
}
