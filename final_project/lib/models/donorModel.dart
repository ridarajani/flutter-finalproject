class DonorModel {
  String? donatedOccasions;
  String bloodGroup;
  String docWork;
  String diseases;
  String DOB;
  String donatedPreviously;
  String blood_bank;

  DonorModel(
      {this.donatedOccasions = "",
      this.bloodGroup = "",
      this.docWork = '',
      this.diseases = '',
      this.DOB = '',
      this.donatedPreviously = '',
      this.blood_bank = ''});

  factory DonorModel.fromJson(Map<String, dynamic> json) {
    return DonorModel(
        donatedOccasions: json["donatedOccasions"],
        bloodGroup: json["bloodGroup"],
        docWork: json["docWork"],
        diseases: json["diseases"],
        DOB: json["DOB"],
        donatedPreviously: json["donatedPreviously"],
        blood_bank: json["blood_bank"]);
  }

  toJson() {
    return {
      "donatedOccasions": donatedOccasions,
      "bloodGroup": bloodGroup,
      "docWork": docWork,
      "diseases": diseases,
      "DOB": DOB,
      "donatedPreviously": donatedPreviously,
      "blood_bank": blood_bank,
    };
  }
}
