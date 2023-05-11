class TransactionHistoryModel {
  late String id;
  late String userId;
  late String accountKey;
  late String type;
  late String currencySign;
  late String currency;
  late String descType;
  late String amount;
  late String balance;
  late String accountNumber;
  late String others;
  late String accountName;
  late String description;
  late String date;
  late String status;
  late String deleted;

  // TransactionHistoryModel(
  //     {this.id,
  //     this.userId,
  //     this.accountKey,
  //     this.type,
  //     this.currencySign,
  //     this.currency,
  //     this.descType,
  //     this.amount,
  //     this.balance,
  //     this.accountNumber,
  //     this.others,
  //     this.accountName,
  //     this.description,
  //     this.date,
  //     this.status,
  //     this.deleted});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    userId = json['user_id'] ?? '';
    accountKey = json['account_key'] ?? '';
    type = json['type'] == null
        ? ''
        : json['type'].toString().contains('deb')
            ? 'debit'
            : json['type'];
    currencySign = json['currency_sign'] ?? '';
    currency = json['currency'] ?? '';
    descType = json['desc_type'] ?? '';
    amount = json['amount'] ?? '';
    balance = json['balance'] ?? '';
    accountNumber = json['account_number'] ?? '';
    others = json['others'] ?? '';
    accountName = json['account_name'] ?? '';
    description = json['description'] ?? '';
    date = json['date'] ?? '';
    status = json['status'] ?? '';
    deleted = json['deleted'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['account_key'] = this.accountKey;
    data['type'] = this.type;
    data['currency_sign'] = this.currencySign;
    data['currency'] = this.currency;
    data['desc_type'] = this.descType;
    data['amount'] = this.amount;
    data['balance'] = this.balance;
    data['account_number'] = this.accountNumber;
    data['others'] = this.others;
    data['account_name'] = this.accountName;
    data['description'] = this.description;
    data['date'] = this.date;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    return data;
  }
}
