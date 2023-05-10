import 'package:abu_bank/models/account_model.dart';
import 'package:abu_bank/requests/accounts.dart';
import 'package:flutter/material.dart';

class AccountDataProvider extends ChangeNotifier {
  List<AccountModel>? accounts;
  bool loading = false;

  getAccountDetails() async {
    loading = true;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();

    final response = await Accounts.getAccounts();
    if (response['status']) {
      accounts = response['data'];
    }

    loading = false;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();
  }
}
