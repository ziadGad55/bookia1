class AuthParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  int? verify_code;

  AuthParams({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.verify_code,
  });

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "verify_code": verify_code
    };
  }
}
