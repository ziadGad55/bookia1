class Editprofilerequest {
  final String? name;
  final String? address;
  final String? phone;

  Editprofilerequest(
      {required this.name, required this.address, required this.phone});

  Map<String, dynamic> toJson() {
    return {"name": name, "address": address, "phone": phone};
  }
}
