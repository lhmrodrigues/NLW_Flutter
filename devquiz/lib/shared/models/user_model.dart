import 'dart:convert';

class UserModel{
  final String name;
  final String photoUrl;
  final int score;

  UserModel({
    required this.name, 
    required this.photoUrl,
    this.score = 0
    });

    Map<String, dynamic> toMap() {
      return{
        'name' : this.name,
        'score': this.score,
        'photoUrl': this.photoUrl
      };
    }

    factory UserModel.fromMap(Map<String, dynamic> map) {
      return UserModel(
                name : map['name'],
                score : map['score'],
                photoUrl : map['photoUrl']
              );
    }

    String toJson()=> json.encode(toMap());

    factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  
}