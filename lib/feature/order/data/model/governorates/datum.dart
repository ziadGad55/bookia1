class Datum {
  int? id;
  String? governorateNameEn;

  Datum({this.id, this.governorateNameEn});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        governorateNameEn: json['governorate_name_en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'governorate_name_en': governorateNameEn,
      };
}
