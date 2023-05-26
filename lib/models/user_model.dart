class User {
  int? id;
  String? userName;
  String? password;
  String? email;
  Tokens? tokens;

  User({this.id, this.userName, this.password, this.email, this.tokens});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['username'];
    email = json['email'];
    tokens =
    json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
  }

  @override
  String toString() {
    return 'User{id: $id, userName: $userName, password: $password, email: $email, tokens: $tokens}';
  }

// Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['username'] = this.userName;
  //   data['email'] = this.email;
  //   if (this.tokens != null) {
  //     data['tokens'] = this.tokens!.toJson();
  //   }
  //   return data;
  // }
}

class Tokens {
  String? refresh;
  String? access;

  Tokens({this.refresh, this.access});

  Tokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    return data;
  }

  @override
  String toString() {
    return 'Tokens{refresh: $refresh, access: $access}';
  }
}