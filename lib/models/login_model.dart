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
  late String zipcode;
  late String location;
  late String securityAnswer;
  late String creditCardBalance;
  late String lastLogin;
  late String lastLoginIp;
  late String token;
  late String displayName;
  late String role;

  LoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? 0;
    email = json['email'] ?? '';
    username = json['username'] ?? '';
    username = json['display_name'] ?? '';
    role = (json['role_id'] ?? '').toString().toLowerCase();
    extractFields(json['usermeta'] is Map ? json['usermeta'] ?? {} : {});
  }

  void extractFields(Map<String, dynamic> json) {
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    gender = json['gender'] ?? '';
    birthday = json['birthday'] ?? '';
    ssn = json['ssn'] ?? '';
    phone = json['phone'] ?? '';
    address = json['address'] ?? '';
    address2 = json['address_2'] ?? '';
    city = json['city'] ?? '';
    creditCardBalance = json['credit_card_balance'] ?? '';
    lastLogin = json['last_login'] ?? '';
    lastLoginIp = json['last_login_ip'] ?? '';
    zipcode = json['zipcode'] ?? '';
    location = json['location'] ?? '';
    securityAnswer = json['security_answer'] ?? '';
  }
}
