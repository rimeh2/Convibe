class Company {
  int? id;
  bool? active;
  String? companyName;
  String? logo;
  String? registrationId;
  String? companyMail;
  String? companyPhone;
  String? workingHours;
  String? shortName;
  String? incorporateYear;
  int? currency;
  int? industry;

  @override
  String toString() {
    return 'Company{id: $id, active: $active, companyName: $companyName, logo: $logo, registrationId: $registrationId, companyMail: $companyMail, companyPhone: $companyPhone, workingHours: $workingHours, shortName: $shortName, incorporateYear: $incorporateYear, currency: $currency, industry: $industry}';
  }

  Company(
      {this.id,
      this.active,
      this.companyName,
      this.logo,
      this.registrationId,
      this.companyMail,
      this.companyPhone,
      this.workingHours,
      this.shortName,
      this.incorporateYear,
      this.currency,
      this.industry});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    companyName = json['company_name'];
    logo = json['logo'];
    registrationId = json['registration_id'];
    companyMail = json['company_mail'];
    companyPhone = json['company_phone'];
    workingHours = json['working_hours'];
    shortName = json['short_name'];
    incorporateYear = json['incorporate_year'];
    currency = json['currency'];
    industry = json['industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['company_name'] = this.companyName;
    data['logo'] = this.logo;
    data['registration_id'] = this.registrationId;
    data['company_mail'] = this.companyMail;
    data['company_phone'] = this.companyPhone;
    data['working_hours'] = this.workingHours;
    data['short_name'] = this.shortName;
    data['incorporate_year'] = this.incorporateYear;
    data['currency'] = this.currency;
    data['industry'] = this.industry;
    return data;
  }
}
