class CheckingData {
  double? latitude;
  double? longitude;
  String? checkin;
  String? checkout;

  CheckingData({this.latitude, this.longitude, this.checkin, this.checkout});

  CheckingData.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    checkin = json['checkin'];
    checkout = json['checkout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['checkin'] = checkin;
    data['checkout'] = checkout;
    return data;
  }
}
