import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasked/firebase_utils.dart';
import 'package:tasked/model/task.dart';
import 'package:tasked/provider/list_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  
  var selectedDate = DateTime.now();
  var formKey=GlobalKey<FormState>();
  String title='';
  String description='';
  late ListProvider listProvider;
  @override
 Widget build(BuildContext context) {
 listProvider =Provider.of<ListProvider>(context);
  return Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 ده المهم
          children: [
            Text(
              'Add new Task',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (val) {
                      title = val;
                    },
                    decoration:
                        const InputDecoration(hintText: 'Entre task title'),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please entre task tittle';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (val) {
                      description = val;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please entre task Description';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Entre task Description',
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Select Date',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: showCalander,
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: addTask,
                    child: Text(
                      'Add',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
void addTask() {
  if (!formKey.currentState!.validate()) return;

  Task task = Task( 
    title: title,
    description: description,
    dateTime: selectedDate,
  );

  FirebaseUtils.addTaskToFireStore(task).timeout(Duration(seconds: 5)).timeout(Duration(seconds: 5), onTimeout: () {
   listProvider.getAllTasksFromFireStore(); 
  Navigator.of(context).pop();  
 
  },);

    // Update the local task list
    
  }

  void showCalander() async {
    var chooseDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 356)),
    );
    if(chooseDate !=null){
      selectedDate=chooseDate;
      setState(() {
        
      });
    }
    // selectedDate=chooseDate ?? selectedDate;
  }
}
