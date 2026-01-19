import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:tasked/firebase_utils.dart';
import 'package:tasked/model/task.dart';

class ListProvider extends ChangeNotifier {
  /// data change effect more widgets in the app 
   List<Task> tasks=[];
    void getAllTasksFromFireStore()async {
    QuerySnapshot<Task> querySnapshot =await FirebaseUtils.getTasksCollection().get();
    //List<QueryDocumentSnapshot<Task>>    => List<Task> use map convert type list to different list 
  tasks= querySnapshot.docs.map((docSnap){
    return docSnap.data();
  }).toList(); 
  notifyListeners();
  }

  /// so we use ChangeNotifier
  /// method change data and call notifyListeners()
}