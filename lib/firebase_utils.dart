import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasked/model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    // collection excute two اول حاجه انا هي تدكريت او لو موجود خالص

    // ازاي تعرف فاير بيزا بيخزن ايه
    // من خلاال with withConverter
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
          // هتاخد الجاسون تحولولا لوابجكيت
          fromFirestore: ((snapshot, options) =>
              Task.fromFirestore(snapshot.data()!)),
          // هبعت حاجه للفاير بيزا
          toFirestore: ((task, options) => task.toFireStore()),
        );
  }
/// هبعت داتا للفاير بيزا
  static Future<void> addTaskToFireStore(Task task) {
    var tasksCollectionRef = getTasksCollection(); // collection reference<Task>
    DocumentReference<Task> taskDocRef = tasksCollectionRef.doc();
  // هنا بقى عشان اعمل id خاص بالtask 
    task.id = taskDocRef.id;
    // هبعت الداتا للفاير بيزا  هناك
    return taskDocRef.set(task);
  } 
  static Future<void> deleteTaskFromFireStore(Task task) {
    var tasksCollectionRef = getTasksCollection(); // collection reference<Task>
    DocumentReference<Task> taskDocRef = tasksCollectionRef.doc(task.id);
    return taskDocRef.delete();
  }
}
// fire base بتفهم حاجهه اسمه json|
// {} => json object 
// [] =>json array

