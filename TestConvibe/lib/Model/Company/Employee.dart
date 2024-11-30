class Employee {
  bool? status;
  String? message;
  List<Data>? data;

  Employee({this.status, this.message, this.data});

  Employee.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  bool? activated;
  String? createdDate;
  String? lastModifiedDate;
  String? image;
  int? employmentType;
  int? salutation;
  String? firstName;
  String? lastName;
  String? countryCodeMobile;
  String? mobileNumber;
  String? personalEmail;
  String? emergencyEmail;
  String? countryCodeEmergency;
  String? emergencyContact;
  int? emergencyContactSalutation;
  String? emergencyContactName;
  int? emergencyContactRelationship;
  String? countryCodeWork;
  String? workContact;
  String? email;
  String? city;
  bool? citizen;
  String? dateOfBirth;
  int? gender;
  String? hrId;
  String? joiningDate;
  String? arrivalDate;
  String? nickname;
  int? bloodGrp;
  bool? isRoster;
  bool? perAddSame;
  String? permanentAddress;
  String? localAddress;
  int? religion;
  int? maritalStatus;
  bool? exemptFromSchedule;
  bool? isDriver;
  bool? exemptFromOvertime;
  String? hourlyRate;
  String? basicHourlyRate;
  int? employeeType;
  int? activeStatus;
  bool? vacationEligible;
  bool? isWorkFromHome;
  bool? isManagement;
  bool? isAccountant;
  bool? isHr;
  bool? employeeSelfServiceEnabled;
  int? lastModifiedBy;
  int? company;
  int? designation;
  int? department;
  int? country;
  int? employeeLevel;
  int? rootUser;

  Data(
      {this.id,
      this.activated,
      this.createdDate,
      this.lastModifiedDate,
      this.image,
      this.employmentType,
      this.salutation,
      this.firstName,
      this.lastName,
      this.countryCodeMobile,
      this.mobileNumber,
      this.personalEmail,
      this.emergencyEmail,
      this.countryCodeEmergency,
      this.emergencyContact,
      this.emergencyContactSalutation,
      this.emergencyContactName,
      this.emergencyContactRelationship,
      this.countryCodeWork,
      this.workContact,
      this.email,
      this.city,
      this.citizen,
      this.dateOfBirth,
      this.gender,
      this.hrId,
      this.joiningDate,
      this.arrivalDate,
      this.nickname,
      this.bloodGrp,
      this.isRoster,
      this.perAddSame,
      this.permanentAddress,
      this.localAddress,
      this.religion,
      this.maritalStatus,
      this.exemptFromSchedule,
      this.isDriver,
      this.exemptFromOvertime,
      this.hourlyRate,
      this.basicHourlyRate,
      this.employeeType,
      this.activeStatus,
      this.vacationEligible,
      this.isWorkFromHome,
      this.isManagement,
      this.isAccountant,
      this.isHr,
      this.employeeSelfServiceEnabled,
      this.lastModifiedBy,
      this.company,
      this.designation,
      this.department,
      this.country,
      this.employeeLevel,
      this.rootUser});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activated = json['activated'];
    createdDate = json['created_date'];
    lastModifiedDate = json['last_modified_date'];
    image = json['image'];
    employmentType = json['employment_type'];
    salutation = json['salutation'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCodeMobile = json['country_code_mobile'];
    mobileNumber = json['mobile_number'];
    personalEmail = json['personal_email'];
    emergencyEmail = json['emergency_email'];
    countryCodeEmergency = json['country_code_emergency'];
    emergencyContact = json['emergency_contact'];
    emergencyContactSalutation = json['emergency_contact_salutation'];
    emergencyContactName = json['emergency_contact_name'];
    emergencyContactRelationship = json['emergency_contact_relationship'];
    countryCodeWork = json['country_code_work'];
    workContact = json['work_contact'];
    email = json['email'];
    city = json['city'];
    citizen = json['citizen'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    hrId = json['hr_id'];
    joiningDate = json['joining_date'];
    arrivalDate = json['arrival_date'];
    nickname = json['nickname'];
    bloodGrp = json['blood_grp'];
    isRoster = json['is_roster'];
    perAddSame = json['per_add_same'];
    permanentAddress = json['permanent_address'];
    localAddress = json['local_address'];
    religion = json['religion'];
    maritalStatus = json['marital_status'];
    exemptFromSchedule = json['exempt_from_schedule'];
    isDriver = json['is_driver'];
    exemptFromOvertime = json['exempt_from_overtime'];
    hourlyRate = json['hourly_rate'];
    basicHourlyRate = json['basic_hourly_rate'];
    employeeType = json['employee_type'];
    activeStatus = json['active_status'];
    vacationEligible = json['vacation_eligible'];
    isWorkFromHome = json['is_work_from_home'];
    isManagement = json['is_management'];
    isAccountant = json['is_accountant'];
    isHr = json['is_hr'];
    employeeSelfServiceEnabled = json['employee_self_service_enabled'];
    lastModifiedBy = json['last_modified_by'];
    company = json['company'];
    designation = json['designation'];
    department = json['department'];
    country = json['country'];
    employeeLevel = json['employee_level'];
    rootUser = json['root_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activated'] = this.activated;
    data['created_date'] = this.createdDate;
    data['last_modified_date'] = this.lastModifiedDate;
    data['image'] = this.image;
    data['employment_type'] = this.employmentType;
    data['salutation'] = this.salutation;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country_code_mobile'] = this.countryCodeMobile;
    data['mobile_number'] = this.mobileNumber;
    data['personal_email'] = this.personalEmail;
    data['emergency_email'] = this.emergencyEmail;
    data['country_code_emergency'] = this.countryCodeEmergency;
    data['emergency_contact'] = this.emergencyContact;
    data['emergency_contact_salutation'] = this.emergencyContactSalutation;
    data['emergency_contact_name'] = this.emergencyContactName;
    data['emergency_contact_relationship'] = this.emergencyContactRelationship;
    data['country_code_work'] = this.countryCodeWork;
    data['work_contact'] = this.workContact;
    data['email'] = this.email;
    data['city'] = this.city;
    data['citizen'] = this.citizen;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['hr_id'] = this.hrId;
    data['joining_date'] = this.joiningDate;
    data['arrival_date'] = this.arrivalDate;
    data['nickname'] = this.nickname;
    data['blood_grp'] = this.bloodGrp;
    data['is_roster'] = this.isRoster;
    data['per_add_same'] = this.perAddSame;
    data['permanent_address'] = this.permanentAddress;
    data['local_address'] = this.localAddress;
    data['religion'] = this.religion;
    data['marital_status'] = this.maritalStatus;
    data['exempt_from_schedule'] = this.exemptFromSchedule;
    data['is_driver'] = this.isDriver;
    data['exempt_from_overtime'] = this.exemptFromOvertime;
    data['hourly_rate'] = this.hourlyRate;
    data['basic_hourly_rate'] = this.basicHourlyRate;
    data['employee_type'] = this.employeeType;
    data['active_status'] = this.activeStatus;
    data['vacation_eligible'] = this.vacationEligible;
    data['is_work_from_home'] = this.isWorkFromHome;
    data['is_management'] = this.isManagement;
    data['is_accountant'] = this.isAccountant;
    data['is_hr'] = this.isHr;
    data['employee_self_service_enabled'] = this.employeeSelfServiceEnabled;
    data['last_modified_by'] = this.lastModifiedBy;
    data['company'] = this.company;
    data['designation'] = this.designation;
    data['department'] = this.department;
    data['country'] = this.country;
    data['employee_level'] = this.employeeLevel;
    data['root_user'] = this.rootUser;
    return data;
  }
}
