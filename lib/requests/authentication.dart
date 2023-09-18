import 'dart:convert';

import 'package:abu_bank/helper/constants.dart';
import 'package:abu_bank/models/login_model.dart';
import 'package:http/http.dart' as http;

class Authentication {
  static Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    String url = '$baseUrl/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        token = data['token'];

        return {'status': true, 'data': LoginModel.fromJson(data['data'])};
      }
      return {
        'status': false,
        'message': jsonDecode(response.body)['message'] ?? 'An error occurred',
      };
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> emailExists(String email) async {
    String url = '$baseUrl/check-email-exists';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'email': email}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        bool exists = data['exists'];
        if (exists) {
          final response2 = await sendResetCode(email);
          if (response2['status']) {
            return {'status': true, 'token': response2['token']};
          } else {
            return {'status': false, 'message': response2['message']};
          }
        }

        return {
          'status': false,
          'message': 'No account exists for provided email',
        };
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> sendResetCode(String email) async {
    String url = '$baseUrl/reset-password';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'email': email}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {'status': true, 'token': data['token']};
      }
      return {
        'status': false,
        'message': jsonDecode(response.body)['message'] ?? 'An error occurred'
      };
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> updatePassword({
    required String email,
    required String otp,
    required String password,
    required String token,
  }) async {
    String url = '$baseUrl/update-password';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "otp": otp,
          "password": password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return {'status': true, 'data': data['exists']};
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }
}
