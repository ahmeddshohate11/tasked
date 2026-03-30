class MyUser {
  static const String collectionName = 'users'; 
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;

  MyUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
  });
/// convert user object to map to save it in firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
    };
  }

  MyUser.fromMap(Map<String, dynamic> json)
    : id = json['id'] as String,
      firstName = json['firstName'] as String,
      lastName = json['lastName'] as String,
      userName = json['userName'] as String,
      email = json['email'] as String;
}
