class GetpatientModel {
  int? id;
  int? userId;
  String? analysisType;
  int? analysisResult;
  String? analysisTest;
  String? createdAt;
  String? updatedAt;

  GetpatientModel(
      {this.id,
      this.userId,
      this.analysisType,
      this.analysisResult,
      this.analysisTest,
      this.createdAt,
      this.updatedAt});

  GetpatientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    analysisType = json['analysis_type'];
    analysisResult = json['analysis_result'];
    analysisTest = json['analysis_test'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['analysis_type'] = this.analysisType;
    data['analysis_result'] = this.analysisResult;
    data['analysis_test'] = this.analysisTest;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
