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
          'user_id': userData!.userId,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

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
          'user_id': userData!.userId,
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
          'user_id': userData!.userId,
          'pin_code': pin,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          return {'status': true};
        } else {
          return {
            'status': false,
            'message': data['data'] ?? 'Failed to set pin'
          };
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> verifyPin(String pin) async {
    String url = '$baseUrl/api/api.php?action=verifyCode';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': userData!.userId,
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

  static Future<Map<String, dynamic>> getBeneficiary(
      {required String bankCode, required String accountNumber}) async {
    String url = '$baseUrl/api/api.php?action=lookup';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'bank_code': bankCode,
          'account_number': accountNumber,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        if (data['status'].toString().toLowerCase() == 'success') {
          if (data['data']['status'].toString().toLowerCase() == 'error') {
            return {
              'status': false,
              'message': 'Could not resolve beneficiary'
            };
          }
          return {'status': true, 'data': data['data']['account_name']};
        } else {
          return {
            'status': false,
            'message': data['data'] ?? 'Could not resolve beneficiary'
          };
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> localTransfer({
    required String bankName,
    required String accountNumber,
    required String accountName,
    required String accountKey,
    required String amount,
    required String description,
  }) async {
    String url = '$baseUrl/api/api.php?action=localTransfer';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'account_key': accountKey,
          'amount': amount,
          'bank_name': bankName,
          'account_number': accountNumber,
          'account_name': accountName,
          'user_id': userData!.userId,
          'description': description,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          return {'status': true, 'data': data['']};
        } else {
          return {
            'status': false,
            'message': data['data'] ?? 'Failed to send money'
          };
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }
}
