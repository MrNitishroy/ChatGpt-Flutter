
class ChatModel {
  String? message;
  String? role;

  ChatModel({this.message, this.role});

  ChatModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["role"] = role;
    return _data;
  }
}