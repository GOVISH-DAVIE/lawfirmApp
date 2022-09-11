class ClientsModel {
  int? id;
  String? slug;
  String? firstName;
  String? secondName;
  String? lastName;
  String? companyName;
  String? phone;
  String? email;
  String? country;
  String? address;

  ClientsModel(
      {this.id,
      this.slug,
      this.firstName,
      this.secondName,
      this.lastName,
      this.companyName,
      this.phone,
      this.email,
      this.country,
      this.address});

  ClientsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    phone = json['phone'];
    email = json['email'];
    country = json['country'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['last_name'] = lastName;
    data['company_name'] = companyName;
    data['phone'] = phone;
    data['email'] = email;
    data['country'] = country;
    data['address'] = address;
    return data;
  }
}
