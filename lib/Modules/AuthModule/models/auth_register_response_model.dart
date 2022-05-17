class AuthRegisterResponseModel {
  int? id;
  String? token;

  AuthRegisterResponseModel({this.id, this.token});

  AuthRegisterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}
