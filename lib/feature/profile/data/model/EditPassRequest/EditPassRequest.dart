class EditPass {
  final String? currentassword;
  final String? newpassword;
  final String? newpasswordconfirmation;

  EditPass(
      {required this.currentassword,
      required this.newpassword,
      required this.newpasswordconfirmation});

  Map<String, dynamic> toJson() {
    return {
      "current_password": currentassword,
      "new_password": newpassword,
      "new_password_confirmation": newpasswordconfirmation
    };
  }
}
