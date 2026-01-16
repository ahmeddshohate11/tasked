import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  /// data class
  static const String collectionName='tasks';
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  Task({
    this.id = '',
    required this.title,
    required this.dateTime,
    required this.description,
    this.isDone = false,

    /// objects=>developer
    /// objects=>json  firebawse known
    /// json=>object    you known
    /// twoFunctions
    ///
    ///
  });

  //ده رايح للفاير بيزا
// object to json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }
  // ده خاص يبينا احنا بقا هناخد الداتا من فاير بيزا ونحولها لحاجه نفهمه
  //json to object"
 Task.fromFirestore(Map<String,dynamic> data):this(
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
id: data['id'] as String,
title: data['title'] as String,
description: data['description'] as String,
isDone: data['isDone'] as bool,

 );


}
  