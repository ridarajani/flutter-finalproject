class BloodBankModel {
  String name;

  BloodBankModel({
    this.name = "",
  });

  factory BloodBankModel.fromJson(Map<String, dynamic> json) {
    return BloodBankModel(
      name: json["name"],
    );
  }

  toJson() {
    return {
      "name": name,
    };
  }
}
