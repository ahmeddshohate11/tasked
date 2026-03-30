import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasked/model/user.dart';

class DataBaseUtils {
  static CollectionReference<MyUser> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        /// ايه فايدته ال with converter=>  هي بس بتعرف للفاير بيزا ازاي يحول الداتا اللي جايه من الفاير بيزا لابجكيت و العكس  
        .withConverter<MyUser>(
          /// هتاخد الجاسون تحولولا لوابجكيت 
          /// snapshot.data()! =>  json
          /// MyUser.fromMap =>  من الجاسون لابجكيت
          /// ايه فايدته snapshot.data()! =>  عشان اخد الداتا اللي جايه من الفاير بيزا
          /// MyUser.fromMap =>  عشان اخد الجاسون اللي جايه من الفاير بيزا و احولها لابجكيت   
          /// toFirestore: ((user, options) => user.toMap()) => من الابجكيت للجاسون 
          fromFirestore: ((snapshot, options) =>
              MyUser.fromMap(snapshot.data()!)),
          toFirestore: ((user, options) => user.toMap()),
        );
  }
static Future<void> addMyUseregisterUSer(MyUser user) async {
    await getTasksCollection().doc(user.id).set(user);
  }
  static Future<void> getUserCollection(String userId) async {
    await getTasksCollection().doc(userId).get();
  }
  static Future<MyUser?> getUser(MyUser user) async {
  var documentSnapShot=  await getTasksCollection().doc(user.id).get();
  return documentSnapShot.data();
  
  } 
 


  
}
