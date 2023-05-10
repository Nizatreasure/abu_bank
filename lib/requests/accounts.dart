import 'dart:convert';

import 'package:abu_bank/models/account_model.dart';
import 'package:http/http.dart' as http;

import '../helper/constants.dart';

class Accounts {
  static Future<Map<String, dynamic>> getAccounts() async {
    String url = '$baseUrl/api/api.php?action=login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'user_id': userData!.userId}),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          List<AccountModel> accounts = <AccountModel>[];
          (data['data'] as List).forEach((element) {
            accounts.add(AccountModel.fromJson(element));
          });
          return {'status': true, 'data': accounts};
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