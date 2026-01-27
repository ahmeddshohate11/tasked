import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:tasked/firebase_utils.dart';
import 'package:tasked/model/task.dart';

class ListProvider extends ChangeNotifier {
  /// data change effect more widgets in the app 
   List<Task> tasks=[];
   DateTime selectedDate=DateTime.now();
   
   /// هنا بنجيب الداتا من الفايرستور 
   /// ونخزنها في ليست محلية
    void getAllTasksFromFireStore()async {
    QuerySnapshot<Task> querySnapshot =await FirebaseUtils.getTasksCollection().get();
    //List<QueryDocumentSnapshot<Task>>    => List<Task> use map convert type list to different list 
  tasks= querySnapshot.docs.map((docSnap){
    return docSnap.data();
  }).toList(); 
  /// sorting tasks => dateTime ascending
  tasks.sort((Task task1,Task task2){
    return task1.dateTime.compareTo(task2.dateTime);
  });
  /// filter tasks by selected date
  /// ex : selected date 2024-06-20
  /// tasks date 2024-06-20 10:00 
  ///   we need only tasks of selected date
  tasks=tasks.where((task) {
    if(selectedDate.year==task.dateTime.year&&
    selectedDate.month==task.dateTime.month&&
    selectedDate.day==task.dateTime.day){
      return true;
    }
    return false;
  }).toList();
  notifyListeners();
  }
  
 void changeSelectedDate(DateTime newSelectedDate){
    selectedDate=newSelectedDate;
    getAllTasksFromFireStore();
    notifyListeners();
  }
  /// so we use ChangeNotifier
  /// method change data and call notifyListeners()
}