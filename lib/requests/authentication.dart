import 'dart:convert';

import 'package:abu_bank/helper/constants.dart';
import 'package:abu_bank/models/login_model.dart';
import 'package:http/http.dart' as http;

class Authentication {
  static Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    String url = '$baseUrl/api/api.php?action=login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          return {'status': true, 'data': LoginModel.fromJson(data['data'])};
        } else {
          return {'status': false, 'message': data['message']};
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }
}
