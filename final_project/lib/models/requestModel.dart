class RequestModel {
  final String requesterID;
  final String donorID;
  final String location;
  final String donReqTime;
  final String requestStatus;
  final String createdAt;
  final String? updatedAt;

  RequestModel({
    required this.requesterID,
    required this.donorID,
    required this.location,
    required this.donReqTime,
    required this.requestStatus,
    required this.createdAt,
    this.updatedAt,
  });

  /* factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
        requesterID: json["requesterID"],
        donorID: json["donorID"],
        location: json["location"],
        donReqTime: json["donReqTime"],
        requestStatus: json["requestStatus"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"]);
  } */
/* 
  toJson() {
    return {
      "price": price,
      "name": name,
      "img": img,
    };
  } */
}
