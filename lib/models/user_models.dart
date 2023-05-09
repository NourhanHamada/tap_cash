class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? token;
  // String? renewalToken;
  // bool? onboardingSeen;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.token,
    // this.renewalToken,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      firstName: responseData['firstName'],
      lastName: responseData['lastName'],
      email: responseData['email'],
      phone: responseData['phone'],
      token: responseData['token'],
    );
    // renewalToken: responseData['renewalToken']);
  }
}
