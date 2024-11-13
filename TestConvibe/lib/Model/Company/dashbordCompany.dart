class Dashbord {
  bool? status;
  String? message;
  Data? data;

  Dashbord({this.status, this.message, this.data});

  Dashbord.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? companyName;
  String? logo;
  String? registrationId;
  String? companyMail;
  String? companyPhone;
  int? currency;
  int? industry;
  String? workingHours;
  String? shortName;
  String? incorporateYear;
  List<NationalityWiseEmployeeCount>? nationalityWiseEmployeeCount;
  List<GenderWiseEmployeeCount>? genderWiseEmployeeCount;
  CompanyAddress? companyAddress;
  EmployeesCount? employeesCount;

  Data(
      {this.id,
      this.companyName,
      this.logo,
      this.registrationId,
      this.companyMail,
      this.companyPhone,
      this.currency,
      this.industry,
      this.workingHours,
      this.shortName,
      this.incorporateYear,
      this.nationalityWiseEmployeeCount,
      this.genderWiseEmployeeCount,
      this.companyAddress,
      this.employeesCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    logo = json['logo'];
    registrationId = json['registration_id'];
    companyMail = json['company_mail'];
    companyPhone = json['company_phone'];
    currency = json['currency'];
    industry = json['industry'];
    workingHours = json['working_hours'];
    shortName = json['short_name'];
    incorporateYear = json['incorporate_year'];
    if (json['nationality_wise_employee_count'] != null) {
      nationalityWiseEmployeeCount = <NationalityWiseEmployeeCount>[];
      json['nationality_wise_employee_count'].forEach((v) {
        nationalityWiseEmployeeCount!
            .add(new NationalityWiseEmployeeCount.fromJson(v));
      });
    }
    if (json['gender_wise_employee_count'] != null) {
      genderWiseEmployeeCount = <GenderWiseEmployeeCount>[];
      json['gender_wise_employee_count'].forEach((v) {
        genderWiseEmployeeCount!.add(new GenderWiseEmployeeCount.fromJson(v));
      });
    }
    companyAddress = json['company_address'] != null
        ? new CompanyAddress.fromJson(json['company_address'])
        : null;
    employeesCount = json['employees_count'] != null
        ? new EmployeesCount.fromJson(json['employees_count'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['logo'] = this.logo;
    data['registration_id'] = this.registrationId;
    data['company_mail'] = this.companyMail;
    data['company_phone'] = this.companyPhone;
    data['currency'] = this.currency;
    data['industry'] = this.industry;
    data['working_hours'] = this.workingHours;
    data['short_name'] = this.shortName;
    data['incorporate_year'] = this.incorporateYear;
    if (this.nationalityWiseEmployeeCount != null) {
      data['nationality_wise_employee_count'] =
          this.nationalityWiseEmployeeCount!.map((v) => v.toJson()).toList();
    }
    if (this.genderWiseEmployeeCount != null) {
      data['gender_wise_employee_count'] =
          this.genderWiseEmployeeCount!.map((v) => v.toJson()).toList();
    }
    if (this.companyAddress != null) {
      data['company_address'] = this.companyAddress!.toJson();
    }
    if (this.employeesCount != null) {
      data['employees_count'] = this.employeesCount!.toJson();
    }
    return data;
  }
}

class NationalityWiseEmployeeCount {
  String? country;
  int? count;
  double? percentage;

  NationalityWiseEmployeeCount({this.country, this.count, this.percentage});

  NationalityWiseEmployeeCount.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    count = json['count'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['count'] = this.count;
    data['percentage'] = this.percentage;
    return data;
  }
}

class GenderWiseEmployeeCount {
  String? gender;
  int? count;
  double? percentage;

  GenderWiseEmployeeCount({this.gender, this.count, this.percentage});

  GenderWiseEmployeeCount.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    count = json['count'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['count'] = this.count;
    data['percentage'] = this.percentage;
    return data;
  }
}

class CompanyAddress {
  String? addressName;
  String? addressLine1;
  String? addressLine2;
  String? town;
  String? state;
  String? province;
  String? postCode;
  int? country;

  CompanyAddress(
      {this.addressName,
      this.addressLine1,
      this.addressLine2,
      this.town,
      this.state,
      this.province,
      this.postCode,
      this.country});

  CompanyAddress.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    town = json['town'];
    state = json['state'];
    province = json['province'];
    postCode = json['post_code'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_name'] = this.addressName;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['town'] = this.town;
    data['state'] = this.state;
    data['province'] = this.province;
    data['post_code'] = this.postCode;
    data['country'] = this.country;
    return data;
  }
}

class EmployeesCount {
  int? vacationCount;
  int? absenteeCount;
  int? totalEmployees;

  EmployeesCount({this.vacationCount, this.absenteeCount, this.totalEmployees});

  EmployeesCount.fromJson(Map<String, dynamic> json) {
    vacationCount = json['vacation_count'];
    absenteeCount = json['absentee_count'];
    totalEmployees = json['total_employees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vacation_count'] = this.vacationCount;
    data['absentee_count'] = this.absenteeCount;
    data['total_employees'] = this.totalEmployees;
    return data;
  }
}
