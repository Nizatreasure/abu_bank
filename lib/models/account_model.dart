class AccountModel {
  late String id;
  late String type;
  late String accountNumber;
  late String accountRoutine;
  late String balance;
  late String pendingBalance;
  late String accountKey;
  late String date;
  late String status;

  // AccountModel(
  //     {this.id,
  //     this.type,
  //     this.accountNumber,
  //     this.accountRoutine,
  //     this.balance,
  //     this.pendingBalance,
  //     this.accountKey,
  //     this.date,
  //     this.status});

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    type = json['type'] ?? '';
    accountNumber = json['account_number'] ?? '';
    accountRoutine = json['account_routine'] ?? '';
    balance = json['balance'] ?? '';
    pendingBalance = json['pending_balance'] ?? '';
    accountKey = json['account_key'] ?? '';
    date = json['date'] ?? '';
    status = json['status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['account_number'] = this.accountNumber;
    data['account_routine'] = this.accountRoutine;
    data['balance'] = this.balance;
    data['pending_balance'] = this.pendingBalance;
    data['account_key'] = this.accountKey;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}
