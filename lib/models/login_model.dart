class LoginModel {
  late int userId;
  late String email;
  late String username;
  late String firstName;
  late String lastName;
  late String gender;
  late String birthday;
  late String ssn;
  late String phone;
  late String address;
  late String address2;
  late String city;
  late String state;
  late String zipcode;
  late String location;
  late String securityAnswer;
  late String creditCardBalance;
  late String lastLogin;
  late String lastLoginIp;

  // LoginModel(
  //     {this.userId,
  //     this.email,
  //     this.username,
  //     this.firstName,
  //     this.lastName,
  //     this.gender,
  //     this.birthday,
  //     this.ssn,
  //     this.phone,
  //     this.address,
  //     this.address2,
  //     this.city,
  //     this.state,
  //     this.zipcode,
  //     this.location,
  //     this.securityAnswer,
  //     this.creditCardBalance,
  //     this.lastLogin,
  //     this.lastLoginIp});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? 0;
    email = json['email'] ?? '';
    username = json['username'] ?? '';
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    gender = json['gender'] ?? '';
    birthday = json['birthday'] ?? '';
    ssn = json['ssn'] ?? '';
    phone = json['phone'] ?? '';
    address = json['address'] ?? '';
    address2 = json['address_2'] ?? '';
    city = json['city'] ?? '';
    state = json['state'] ?? '';
    zipcode = json['zipcode'] ?? '';
    location = json['location'] ?? '';
    securityAnswer = json['security_answer'] ?? '';
    creditCardBalance = json['credit_card_balance'] ?? '';
    lastLogin = json['last_login'] ?? '';
    lastLoginIp = json['last_login_ip'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['ssn'] = this.ssn;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['location'] = this.location;
    data['security_answer'] = this.securityAnswer;
    data['credit_card_balance'] = this.creditCardBalance;
    data['last_login'] = this.lastLogin;
    data['last_login_ip'] = this.lastLoginIp;
    return data;
  }
}
