class DoctorModel {
  int? id;
  int? userId;
  String? specialization;
  String? idFace;
  String? identificationCardFace;
  String? identificationCardBack;
  String? profilePic;
  int? accountStatus;
  String? clinicGovernorate;
  String? clinicAddress;
  String? createdAt;
  String? updatedAt;

  DoctorModel(
      {this.id,
      this.userId,
      this.specialization,
      this.idFace,
      this.identificationCardFace,
      this.identificationCardBack,
      this.profilePic,
      this.accountStatus,
      this.clinicGovernorate,
      this.clinicAddress,
      this.createdAt,
      this.updatedAt});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    specialization = json['Specialization'];
    idFace = json['id_face'];
    identificationCardFace = json['identification_card_face'];
    identificationCardBack = json['identification_card_back'];
    profilePic = json['profile_pic'];
    accountStatus = json['account_status'];
    clinicGovernorate = json['clinic_governorate'];
    clinicAddress = json['clinic_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['Specialization'] = this.specialization;
    data['id_face'] = this.idFace;
    data['identification_card_face'] = this.identificationCardFace;
    data['identification_card_back'] = this.identificationCardBack;
    data['profile_pic'] = this.profilePic;
    data['account_status'] = this.accountStatus;
    data['clinic_governorate'] = this.clinicGovernorate;
    data['clinic_address'] = this.clinicAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
