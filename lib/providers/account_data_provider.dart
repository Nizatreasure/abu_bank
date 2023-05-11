import 'package:abu_bank/models/account_model.dart';
import 'package:abu_bank/models/bank_model.dart';
import 'package:abu_bank/requests/accounts.dart';
import 'package:flutter/material.dart';

class AccountDataProvider extends ChangeNotifier {
  List<AccountModel>? accounts;
  bool loadingDetails = false;
  AccountModel? selectedAccount;
  bool hasSetPin = false;

  List<BankModel>? banks;
  bool loadingBanks = false;

  changeSelectedAccount(AccountModel account) async {
    selectedAccount = account;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();
  }

  Future<void> getAccountDetails() async {
    if (loadingDetails) return;
    loadingDetails = true;
    await Future.delayed(const Duration(milliseconds: 1));
    if (accounts == null) notifyListeners();

    final response = await Accounts.getAccounts();

    if (response['status']) {
      accounts = response['data']['data'];
      hasSetPin = response['data']['hasSetPin'];
    }

    loadingDetails = false;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();
  }

  Future<void> getBanks() async {
    if (loadingBanks) return;
    loadingBanks = true;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();

    final response = await Accounts.getBanks();

    if (response['status']) {
      banks = response['data'];
    }

    loadingBanks = false;
    await Future.delayed(const Duration(milliseconds: 1));
    notifyListeners();
  }
}
