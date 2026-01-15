import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasked/model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection(){
     // collection excute two اول حاجه انا هي تدكريت او لو موجود خالص 

     // ازاي تعرف فاير بيزا بيخزن ايه 
     // من خلاال with withConverter
return     FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
      // هتاخد الجاسون تحولولا لوابجكيت 
      fromFirestore: 
     ((snapshot,options)=>
     Task.fromFirestore(snapshot.data()!))
    ,
    // هبعت حاجه للفاير بيزا
     toFirestore:((task,options)=>task.toFireStore()) );

  }
  static void addTaskToFireStore(){
   

  }
}
// fire base بتفهم حاجهه اسمه json|
// {} => json object 
// [] =>json array

