import 'dart:convert';

import 'package:abu_bank/models/account_model.dart';
import 'package:abu_bank/models/bank_model.dart';
import 'package:http/http.dart' as http;

import '../helper/constants.dart';

class Accounts {
  static Future<Map<String, dynamic>> getAccounts() async {
    String url = '$baseUrl/api/api.php?action=account';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': 23,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      print(response.statusCode);
      print(response.reasonPhrase);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          List<AccountModel> accounts = <AccountModel>[];
          (data['data'] as List).forEach((element) {
            accounts.add(AccountModel.fromJson(element));
          });
          return {
            'status': true,
            'data': {'hasSetPin': data['hasSetPin'], 'data': accounts}
          };
        } else {
          return {'status': false, 'message': data['message']};
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> getBanks() async {
    String url = '$baseUrl/api/api.php?action=bank';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': 23,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          List<BankModel> banks = <BankModel>[];
          (data['data'] as List).forEach((element) {
            banks.add(BankModel.fromJson(element));
          });
          return {'status': true, 'data': banks};
        } else {
          return {'status': false, 'message': data['message']};
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> createPin(String pin) async {
    String url = '$baseUrl/api/api.php?action=pincode';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': 23,
          'pin_code': pin,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          print('here');
          return {'status': true};
        } else {
          print('instread');
          return {
            'status': false,
            'message': data['data'] ?? 'Failed to set pin'
          };
        }
      }
      throw (Error());
    } catch (_) {
      print('throw');
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> verifyPin(String pin) async {
    String url = '$baseUrl/api/api.php?action=verifyCode';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': 23,
          'pin_code': pin,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          return {'status': true};
        } else {
          return {'status': false, 'message': data['data'] ?? 'Incorrect pin'};
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }
}
