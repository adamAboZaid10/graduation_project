class patientModel {
  int? id;
  String? patientName;
  int? patientAge;
  String? patientGender;
  int? cKDTestNumber;

  patientModel(
      {this.id,
      this.patientName,
      this.patientAge,
      this.patientGender,
      this.cKDTestNumber});

  patientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientName = json['patient_name'];
    patientAge = json['Patient_age'];
    patientGender = json['Patient_gender'];
    cKDTestNumber = json['CKD_Test_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_name'] = this.patientName;
    data['Patient_age'] = this.patientAge;
    data['Patient_gender'] = this.patientGender;
    data['CKD_Test_number'] = this.cKDTestNumber;
    return data;
  }
}
