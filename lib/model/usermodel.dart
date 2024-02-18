// ignore_for_file: public_member_api_docs, sort_constructors_first


class UserModel {
  String? id;
  String? usename;
  String? email;

  UserModel({this.id,this.email,this.usename});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'usename': usename,
      'email': email,
    };
  }

}
