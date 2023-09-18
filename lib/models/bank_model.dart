class BankModel {
  late int id;
  late String name;
  late String code;
  late String longcode;
  late String slug;
  late bool active;
  late String country;
  late String currency;
  late String type;

  // BankModel(
  //     {this.id,
  //     this.name,
  //     this.code,
  //     this.longcode,
  //     this.slug,
  //     this.active,
  //     this.country,
  //     this.currency,
  //     this.type});

  BankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    code = json['code'] ?? '';
    longcode = json['longcode'] ?? '';
    slug = json['slug'] ?? '';
    active = (json['active'] ?? '').toString().toLowerCase() == 'true';
    country = json['country'] ?? '';
    currency = json['currency'] ?? '';
    type = json['type'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['longcode'] = this.longcode;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['type'] = this.type;
    return data;
  }
}
