import 'dart:convert';

import 'package:abu_bank/models/account_model.dart';
import 'package:abu_bank/models/bank_model.dart';
import 'package:abu_bank/models/transaction_history_model.dart';
import 'package:http/http.dart' as http;

import '../helper/constants.dart';

class Accounts {
  static Future<Map<String, dynamic>> getAccounts() async {
    String url = '$baseUrl/account';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': userData!.userId,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<AccountModel> accounts = <AccountModel>[];
        (data['data'] as List).forEach((element) {
          accounts.add(AccountModel.fromJson(element));
        });
        return {
          'status': true,
          'data': {'hasSetPin': data['setPin'], 'data': accounts}
        };
      }
      throw (Error());
    } catch (_) {
      print(_);
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> getBanks() async {
    String url = '$baseUrl/bank';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': userData!.userId,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 90));
      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List<BankModel> banks = <BankModel>[];
        (data['data'] as List).forEach((element) {
          banks.add(BankModel.fromJson(element));
        });
        banks.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        return {'status': true, 'data': banks};
      }
      throw (Error());
    } catch (_) {
      print(_);
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> createPin(String pin) async {
    String url = '$baseUrl/pincode';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'pin_code': pin,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        return {'status': true};
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> verifyPin(String pin) async {
    String url = '$baseUrl/verifyCode';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'pin_code': pin,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        return {'status': true};
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }

//not
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
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
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

  static Future<Map<String, dynamic>> getTransactionHistory() async {
    String url = '$baseUrl/transactions';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'user_id': userData!.userId,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'].toString().toLowerCase() == 'success') {
          List<TransactionHistoryModel> history = <TransactionHistoryModel>[];
          (data['data'] as List).forEach((element) {
            history.add(TransactionHistoryModel.fromJson(element));
          });
          history.sort((a, b) => b.id.compareTo(a.id));
          return {'status': true, 'data': history};
        } else {
          return {'status': false, 'message': data['message']};
        }
      }
      throw (Error());
    } catch (_) {
      print(_);
      return {'status': false, 'message': 'An error occurred'};
    }
  }

  static Future<Map<String, dynamic>> transaction({
    required String bankName,
    required String accountNumber,
    required String accountName,
    required String accountKey,
    required String amount,
    required String description,
    String? swiftCode,
    String type = 'debit',
    required String transactionType,
  }) async {
    String url = '$baseUrl/createTransaction';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'account_key': accountKey,
          'amount': amount,
          'bank_name': bankName,
          'account_number': accountNumber,
          'account_name': accountName,
          if (swiftCode != null) 'swiftcode:': swiftCode,
          'description': description,
          'trans_type': transactionType,
          'type': type,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 90));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);
        if (data['status'].toString().toLowerCase() == 'success') {
          return {'status': true};
        } else {
          return {
            'status': false,
            'message': data['message'] ?? 'Failed to send money'
          };
        }
      }
      throw (Error());
    } catch (_) {
      return {'status': false, 'message': 'An error occurred'};
    }
  }
}
