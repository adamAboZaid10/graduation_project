class PatientHistory {
  bool? status;
  List<UserTests>? userTests;

  PatientHistory({this.status, this.userTests});

  PatientHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['user_Tests'] != null) {
      userTests = <UserTests>[];
      json['user_Tests'].forEach((v) {
        userTests!.add(new UserTests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userTests != null) {
      data['user_Tests'] = this.userTests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserTests {
  int? testId;
  String? testType;
  String? testResult;
  String? analysisTest;
  String? date;
  String? time;

  UserTests(
      {this.testId,
        this.testType,
        this.testResult,
        this.analysisTest,
        this.date,
        this.time});

  UserTests.fromJson(Map<String, dynamic> json) {
    testId = json['test_id'];
    testType = json['test_type'];
    testResult = json['test_result'];
    analysisTest = json['analysis_test'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['test_id'] = this.testId;
    data['test_type'] = this.testType;
    data['test_result'] = this.testResult;
    data['analysis_test'] = this.analysisTest;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}