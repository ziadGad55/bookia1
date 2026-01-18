class OrderParams {
  final String fullname;
  final String email;
  final String address;
  final String phone;
  final int governorateId;

  OrderParams({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.address,
    required this.governorateId,
  });
  Map<String, dynamic> toJson() {
    return {
      "governorate_id": governorateId,
      "name": fullname,
      "phone": phone,
      "address": address,
      "email": email
    };
  }
}
