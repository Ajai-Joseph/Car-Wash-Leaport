class CurrentUserModel {
  String id;
  String? name;
  String? email;
  int? walletBalance;

  CurrentUserModel(
      {required this.id, this.name, this.email, this.walletBalance});
  factory CurrentUserModel.fromJson(Map<String, dynamic> json) {
    return CurrentUserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        walletBalance: json['walletBalance']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'walletBalance': walletBalance
    };
  }
}
